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
    },
    getQuestionTest: (req, res) => {
        const { idEvaluacion } = req.params;
        var validate_id = !validator.isEmpty(idEvaluacion);

        if(validate_id){
            mysqlConnection.query(querys.getQuestionTest(idEvaluacion), (err, rows, fields) => {
                if (!err) {
                    
                    if(rows.length > 0){
                        return res.status(200).send({
                            message: 'Success',
                            test: rows
                        }) 
                    }else{
                        return res.status(404).send({
                            message: 'no hay Test registrado con la ID ' + idEvaluacion
                        }) 
                    }
                } else {
                    console.log(err);
                }
            });

        } else {
            return res.status(404).send({
                message: 'Falta el ID de la evaluacion'
            })
        }
    },
    saveScore: (req, res) => {
        const { idAlumno, idEvaluacion, puntaje } = req.body;

        try {
            
            var validate_idAlumno = !validator.isEmpty(idAlumno);
            var validate_idEvaluacion = !validator.isEmpty(idEvaluacion);
            var validate_puntaje = !validator.isEmpty(puntaje);

            if(validate_idAlumno && validate_idEvaluacion && validate_puntaje) {

                mysqlConnection.query(querys.saveScore(idAlumno, idEvaluacion, puntaje), (err, rows, fields) => {
                    if (!err) {
                        return res.status(200).send({
                            message: 'Success',
                            test: rows
                        }) 
                    } else {
                        console.log(err);
                        return res.status(404).send({
                            message: 'Error, no se guardo el registro'
                        }) 
                    }
                });

            }

        } catch (error) {
            
        }
    }
}

module.exports = controller;