class WhoInformation {
  getData = () => {
    try {
      const { data } = await axios.get("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/coronavirus-disease-covid-19#:~:text=symptoms");
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
}

module.exports = WhoInformation