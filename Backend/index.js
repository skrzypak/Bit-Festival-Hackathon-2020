const express = require('express')
const mysql = require('mysql');
const GovStats = require('./GovStats')
const Database = require('./Database')
const cheerio = require('cheerio')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/getCSVFromGOV',async (req, res) => {
  //let data = await new GovStats().getCSVDataProvince()
  let data2 = await new GovStats().getCSVDataCounties();
  // let countiesCsvUri = await new GovStats().getCSVFromGOV('https://www.gov.pl/web/koronawirus/mapa-zarazen-koronawirusem-sars-cov-2-powiaty');
  // console.log("elo: ", countiesCsvUri)

  res.send(data2)
})

app.get('/test',async (req, res) => {
  //let data = await new Database().existsDate()
  // let countiesCsvUri = await new GovStats().getCSVFromGOV('https://www.gov.pl/web/koronawirus/mapa-zarazen-koronawirusem-sars-cov-2-powiaty');
  // console.log("elo: ", countiesCsvUri)

  res.send(data)
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})