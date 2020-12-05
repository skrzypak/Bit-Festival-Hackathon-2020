const axios = require("axios")

const apiKey = '87d06f1d782f4e53a720b2743f5e84e4';
class News {
	getOnetNews = async () => {
		var url = 'http://newsapi.org/v2/top-headlines?' + 'country=us&' + 'apiKey=87d06f1d782f4e53a720b2743f5e84e4';
		const { data } = await axios.get(url);
    console.log(data)
	};
}

module.exports = News;
