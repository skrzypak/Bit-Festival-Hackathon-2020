const express = require('express')
const GovStats = require('./GovStats')
const WhoInformation = require('./WhoInformation');
const News = require('./News');
const Database = require('./Database');
const app = express()
const PORT = process.env.PORT || 8080;
const db = new Database()

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/news',async (req, res) => {
  const data = await new News().getOnetNews()
  res.send(data)
})

app.get('/who', (req, res) => {
  new WhoInformation().updateTable()
  res.send("")
})

app.get('/refreshCsvDataProvinceDB',async (req, res) => {
  await new GovStats().getCSVDataProvince()
  res.send("")
})

app.get('/refreshCsvdataCountiesDB',async (req, res) => {
  await new GovStats().getCSVDataCounties();
  res.send("")
})

app.get('/refreshNationalRestrictionsDB', async (req, res) => {
  let date = await new GovStats().getNationalRestrictionsDate();
  date = date[6] + date[7] + date[8] + date[9] + '-' + date[3] + date[4] + '-' + date[0] + date[1]
  let n = await new GovStats().existsNationalRestrictionsDate(date);
  if(n === false) {
    let obj = await new GovStats().getNationalRestrictionsContent();
    await new GovStats().pushNationalRestrictions(obj, date);
    res.send(true)
  } else res.send(false)

});

/**
 * Getting data from database query
 */
app.get('/db', async (req, res) => {
  let query = req._parsedUrl.query;
  query = query.replace('query=','')
  let data = await new Database().get(query);
  console.log(data);
  res.send(data)
});

app.get('test', async (req, res) => {
   //`select * from nationalRestrictions`
   //res.send(0)
}) 

app.listen(PORT, () => {
  console.log(`Example app listening at http://localhost:${PORT}`)
})
