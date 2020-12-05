const express = require('express')
const mysql = require('mysql');
const GovStats = require('./GovStats')
const Database = require('./Database')
const cheerio = require('cheerio');
const WhoInformation = require('./WhoInformation');
const News = require('./News');
const app = express()
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/news',async (req, res) => {
  const data = await new News().getOnetNews()
  res.send(data)
})

app.get('/who', (req, res) => {
  new WhoInformation().updateTable()
  res.send("Done")
})

app.get('/getCSVFromGOV',async (req, res) => {
  //let data = await new GovStats().getCSVDataProvince()
  let data2 = await new GovStats().getCSVDataCounties();
  // let countiesCsvUri = await new GovStats().getCSVFromGOV('https://www.gov.pl/web/koronawirus/mapa-zarazen-koronawirusem-sars-cov-2-powiaty');
  // console.log("elo: ", countiesCsvUri)

  res.send(data2)
})

app.get('/getNationalRestrictions', async (req, res) => {
  let date = await new GovStats().getNationalRestrictionsDate();

  // TODO
  date = date[6] + date[7] + date[8] + date[9] + '-' + date[3] + date[4] + '-' + date[0] + date[1]
  let n = await new GovStats().existsNationalRestrictionsDate(date);

  if(n === false) {
    let obj = await new GovStats().getNationalRestrictionsContent();
    await new GovStats().pushNationalRestrictions(obj, date);

    res.send(true)
  } else console.log("EXISTS")
});


app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`)
})