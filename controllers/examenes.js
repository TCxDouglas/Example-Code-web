const mysqlConnection = require('../database.js');
const validator = require('validator');
const querys = require('../consultas/examenes');

var controller = {
    listEvaluations: (req, res) => {
        const { materia } = req.params;
        var validate_materia = !validator.isEmpty(materia);

        if (validate_materia) {
            mysqlConnection.query(querys.listEvaluations(materia), (err, rows, fields) => {
                if (!err) {

                    if (rows.length > 0) {
                        return res.status(200).send({
                            message: 'Success',
                            evaluations: rows
                        })
                    } else {
                        return res.status(200).send({
                            message: 'No hay examenes disponibles de la materia de ' + materia
                        })
                    }

                } else {
                    console.log(err);
                    return res.status(404).send({
                        message: 'Fallo en la consulta :('
                    })
                }
            });
        } else {
            return res.status(404).send({
                message: 'Falta seleccionar la materia'
            })
        }


    },
    getQuestionTest: (req, res) => {
        const { idEvaluacion } = req.params;
        var validate_id = !validator.isEmpty(idEvaluacion);

        if (validate_id) {
            mysqlConnection.query(querys.getQuestionTest(idEvaluacion), (err, rows, fields) => {
                if (!err) {

                    if (rows.length > 0) {
                        return res.status(200).send({
                            message: 'Success',
                            test: rows
                        })
                    } else {
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

            if (validate_idAlumno && validate_idEvaluacion && validate_puntaje) {

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

            } else {
                return res.status(404).send({
                    message: 'Faltan datos, asegurese de enviar correctamente los datos'
                })
            }

        } catch (error) {

        }
    },
    saveAnswers: (req, res) => {
        const { idCalificacion, idPregunta, respuesta, estado } = req.body;

        try {
            var validate_idCalificacion = !validator.isEmpty(idCalificacion);
            var validate_idPregunta = !validator.isEmpty(idPregunta);
            var validate_respuesta = !validator.isEmpty(respuesta);
            var validate_estado = !validator.isEmpty(estado);

            if (validate_idCalificacion && validate_idPregunta && validate_respuesta && validate_estado) {

                mysqlConnection.query(querys.saveAnswers(idCalificacion, idPregunta, respuesta, estado), (err, rows, fields) => {
                    if (!err) {
                        return res.status(200).send({
                            message: 'Respuesta guardada con exito'
                        })
                    } else {
                        console.log(err);
                        return res.status(404).send({
                            message: 'Error, no se guardo la respuesta'
                        })
                    }
                });
            } else {
                return res.status(404).send({
                    message: 'Faltan datos, asegurese de enviar correctamente los datos'
                })
            }
        } catch (error) {
            console.log(error)
        }


    }
}

module.exports = controller;