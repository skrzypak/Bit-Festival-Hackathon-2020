const axios = require('axios')
const cheerio = require('cheerio')
const fs = require('fs')
const {StringStream} = require("scramjet");
const request = require("request");
const Database = require('./Database');

class GovStats {
    db = new Database()

    /**
     * Get statistic .csv from gov.pl
     * https://www.gov.pl/web/koronawirus/wykaz-zarazen-koronawirusem-sars-cov-2
     * https://www.gov.pl/web/koronawirus/mapa-zarazen-koronawirusem-sars-cov-2-powiaty
     */
    getCSVFromGOV = async (uri) => {
      try {
        const { data } = await axios.get(uri);
        const $ = cheerio.load(data);
        const postTitles = [];
        $('#COVID-19 > div.COVID-19__wrapper > div > div.g-col-12.g-col-tab-5 > div:nth-child(2) > a').each((_idx, el) => {
          const postTitle = $(el).attr("href")
          postTitles.push(postTitle)
        });
        return postTitles[0];
      } catch(e){
        console.log(e)
      }
    }

    getCSVDataProvince = async () => {
        if(this.db.existsProvinceToday()) return;
        let provinceCsvUri = await this.getCSVFromGOV('https://www.gov.pl/web/koronawirus/wykaz-zarazen-koronawirusem-sars-cov-2');
        let i = 0;
        request.get(provinceCsvUri)
          .pipe(new StringStream())
          .CSVParse()
          .each(object => {
            console.log("Row:", object)
            if(i != 0) this.db.addProvince(object)
            i++
          });

    }

    getCSVDataCounties = async () => {
      if(this.db.existsCountieToday()) return;
        let csvUri = await this.getCSVFromGOV('https://www.gov.pl/web/koronawirus/mapa-zarazen-koronawirusem-sars-cov-2-powiaty');
        let i = 0;
        request.get(csvUri)
          .pipe(new StringStream())
          .CSVParse()
          .each(object => {
            console.log("Row:", object)
            if(i != 0) this.db.addCountie(object)
            i++
          });
    }

    /**
     * Get national restriction from gov.pl
     * https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia
     */
    getNationalRestrictionsDate = async () => {
      let uri = "https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia";
        try {
          const { data } = await axios.get(uri);
          const $ = cheerio.load(data);
          const date = [];
          $('#main-content > p.event-date').each((_idx, el) => {
            const d = $(el).text()
            date.push(d);
          });
          return date[0];
        } catch(e){
          console.log(e)
        }
    }


    existsNationalRestrictionsDate = async (date) => {
      let n = await this.db.existsNationalRestrictionsToday(date);
      if(n === true) return true;
      else return false;
    }

    /**
     * Get national restriction from gov.pl
     * https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia
     *
     */
    getNationalRestrictionsContent = async () => {
      let uri = "https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia";
        try {
          const { data } = await axios.get(uri);
          const $ = cheerio.load(data);
          let headers = [];
          let contents = [];

          for(let i = 1; i < 16; i += 2) {
            $('#main-content > div.editor-content > h3:nth-child('+i+')').each((_inx, el) => {
              headers.push($(el).text());
            });
          }
          for(let j = 2; j < 16; j += 2) {;
            $('#main-content > div.editor-content > div:nth-child('+j+')').each((_inx, el) => {
              contents.push($(el).html());
            });
          }
          return {headers: headers, contents: contents};
        } catch(e){
          console.log(e)
        }
    }

    getTestPointsLocation = async () => {

      let uri = "https://pacjent.gov.pl/aktualnosc/test-w-mobilnym-punkcie-pobran";
        try {
          const { data } = await axios.get(uri);
          const $ = cheerio.load(data);;
          let x = $('body > div.dialog-off-canvas-main-canvas > main > div:nth-child(5) > div.google-map').data("url");
          this.db.updateTestPointsLocation(x)
        } catch(e){
          console.log(e)
        }
    }

    /**
     * Get national restriction from gov.pl
     * https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia
     *
     * nationalRestrictions (header, date_, html)
     */
    pushNationalRestrictions = async (obj, date) => {
      for(let i = 0; i < obj.headers.length - 1; i++) {
        this.db.addNationalRestriciton(obj.headers[i], obj.contents[i], date)
      }
    }
}

module.exports = GovStats