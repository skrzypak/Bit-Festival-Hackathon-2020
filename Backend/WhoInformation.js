const cheerio = require('cheerio')
const axios = require("axios");
const Database = require('./Database');

class WhoInformation {
  db = new Database()
  updateTable = async () => {
    try {
      const { data } = await axios.get("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/coronavirus-disease-covid-19#:~:text=symptoms");
      const $ = cheerio.load(data);
      let conn = this.db.createConnection()
      conn.connect(()=>{
        conn.query('truncate whoInfo;')
        for(let i = 1; i < 2; i++){
          let header = $(`#sf-accordion > div:nth-child(${i}) > div.sf-accordion__trigger-panel > a`).text()
          let content = $(`#sf-accordion > div:nth-child(${i}) > div.sf-accordion__content`)
          let query = `INSERT INTO whoInfo (header, content) VALUES ("${header}", '${content.html().replace(`'`,`\\`)}')`
          conn.query(query)
        }
        conn.end()
      })
    } catch(e){
      console.log(e)
    }
  }
}

module.exports = WhoInformation