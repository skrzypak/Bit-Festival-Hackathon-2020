const NewsAPI = require('newsapi');
const news = new NewsAPI('87d06f1d782f4e53a720b2743f5e84e4');

class News {
	getOnetNews = async () => {
    const response = await news.v2.everything({
      q: 'koronawirus',
      domains: 'onet.pl',
      from: '2020-11-25'
    })

    return response

	};
}

module.exports = News;
