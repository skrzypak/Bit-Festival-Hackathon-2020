const mysql = require('mysql');

// const mysqlConfig = {
//     user: "root",
//     password: "zmifas",
//     database: "covid",
//     socketPath: '/cloudsql/covidInfo:'
// };

const mysqlConfig = {
    host: "34.89.135.241",
    user: "root",
    password: "zmifas",
    database: "covid"
};

module.exports = {
    config: mysqlConfig
}