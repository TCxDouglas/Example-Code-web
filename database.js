const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'escolares',
  multipleStatements: true
});

mysqlConnection.connect(function (err) {
  if (err) {
    console.error(err);
    return;
  } else {
    console.log('Base de datos Conectada');
  }
});

module.exports = mysqlConnection;