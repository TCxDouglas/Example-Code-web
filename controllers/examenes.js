const mysqlConnection = require('../database.js');
const validator = require('validator');
const querys = require('../consultas/examenes');

var controller = {
    listEvaluations : (req, res) =>{
        mysqlConnection.query(querys.allEvaluations, (err, rows, fields) => {
            if (!err) {
                return res.status(200).send({
                    message: 'Success',
                    evaluations: rows
                })
            } else {
                console.log(err);
            }
        });
    }
}

module.exports = controller;