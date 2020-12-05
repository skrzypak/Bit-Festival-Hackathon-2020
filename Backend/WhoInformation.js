const cheerio = require('cheerio')
const axios = require("axios");
const Database = require('./Database');
var googleTranslate = require('google-translate')("AIzaSyBHtVSQzb6AjlMZ-Q4inPd8sIiIBQbvNvg");

const text = 'The text to translate, e.g. Hello, world!';
const target = 'The target language, e.g. ru';

class WhoInformation {
  db = new Database()

  updateTable = async () => {
    try {
      const { data } = await axios.get("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/coronavirus-disease-covid-19#:~:text=symptoms");
      const $ = cheerio.load(data);
      let conn = this.db.createConnection()

      return new Promise((resolve, reject) => {
        conn.connect(()=>{
          conn.query('truncate whoInfo;')
          for(let i = 1; i < 17; i++){
            let header = $(`#sf-accordion > div:nth-child(${i}) > div.sf-accordion__trigger-panel > a`).text()
            let content = $(`#sf-accordion > div:nth-child(${i}) > div.sf-accordion__content`)
            googleTranslate.translate(header, 'pl', function(err, translation) {
                let h = translation.translatedText;
                googleTranslate.translate(content.html(), 'pl', function(err, translation) {
                  let c = translation.translatedText;
                  let val = c.replace(`'`,`\\`);
                  let query = `INSERT INTO whoInfo (header, content) VALUES ("${h}", '${val}')`
                  conn.query(query)
                  if(i == 16 ) resolve();
                });
            });
          }
        })
      }).resolve((item) => {
        conn.end()
      }).reject((item) => {
        conn.end()
      })
    } catch(e){
      console.log(e)
    }
  }

}

module.exports = WhoInformation