const mysqlConnection = require('../database.js');
const validator = require('validator');
const { json } = require('express');

var controller = {
    test: (req, res) => {
        return res.status(200).send({
            message: 'Hola Buenas'
        });
    },
    data: (req, res) => {
        mysqlConnection.query('SELECT * FROM usuarios', (err, rows, fields) => {
            if (!err) {
                return res.status(200).send({
                    message: 'Success',
                    users: rows
                })
            } else {
                console.log(err);
            }
        });
    },
    newUser: (req, res) => {
        const { nombre, email, pass, telefono, tipo } = req.body;

        try {
            var validate_nombre = !validator.isEmpty(nombre);
            var validate_email = !validator.isEmpty(email);
            var validate_pass = !validator.isEmpty(pass);
            var validate_telefono = !validator.isEmpty(telefono);
            var validate_tipo = !validator.isEmpty(tipo);

            if (validate_nombre && validate_email & validate_pass && validate_telefono && validate_tipo) {

                const query = `INSERT INTO usuarios (nombre, email, pass, telefono, tipo)
                    VALUES ('${nombre}', '${email}', '${pass}', '${telefono}', '${tipo}')`;

                mysqlConnection.query(query, (err, rows, fields) => {
                    if (!err) {
                        return res.status(200).send({ message: 'Estudiante Registrado', status: 'Exito' });
                    } else {
                        console.log(err);
                    }
                });


            } else {
                return res.status(404).send({
                    message: 'Faltan datos'
                })
            }
        } catch (err) {
            return res.status(404).send({
                message: 'Faltan datos'
            })
        }


    },
    login: (req, res) => {
        const { email, pass } = req.params;

        try {
            var validate_email = !validator.isEmpty(email);
            var validate_pass = !validator.isEmpty(pass);

            if (validate_email && validate_pass) {

                mysqlConnection.query('SELECT * FROM usuarios WHERE email = ? AND pass = ?', [email, pass], (err, rows, fields) => {
                    if (!err) {
                        return res.status(200).send({
                            message: 'Sucess',
                            dataUser: rows
                        })
                    } else {
                        return res.status(404).send({
                            message: 'Datos Incorrectos'
                        })
                    }
                });
            } else {
                return res.status(404).send({
                    message: 'Faltan datos'
                })
            }

        } catch (err) {
            return res.status(404).send({
                message: 'Faltan datos'
            })
        }

    }
}

module.exports = controller;