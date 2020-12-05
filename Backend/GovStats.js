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
     *
     * nationalRestrictions (header, date_, html)
     */
    async getNationalRestrictions() {
        let uri = "https://www.gov.pl/web/koronawirus/aktualne-zasady-i-ograniczenia";
        try {
            const { data } = await axios.get(uri);
            const $ = cheerio.load(data);
            let date;
            $('#main-content > p.event-date').each((_idx, el) => {
              date = $(el).text()
            });

            console.log(date);

            // Check in database
            // if(db.existsNationalRestrictionsToday()) return;

          } catch(e){
            console.log(e)
          }
    }
}

module.exports = GovStats