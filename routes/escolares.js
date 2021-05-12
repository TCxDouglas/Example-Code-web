var express = require('express');
var escolaresControllers = require('../controllers/escolares');
var examenesControllers = require('../controllers/examenes');

var router = express.Router();

router.get('/test', escolaresControllers.test);
router.get('/data', escolaresControllers.data);
router.post('/new', escolaresControllers.newUser);
router.get('/login/:email?/:pass?', escolaresControllers.login);
router.get('/listEvaluations/:materia', examenesControllers.listEvaluations);
router.get('/getQuestionTest/:idEvaluacion', examenesControllers.getQuestionTest);
router.post('/saveScore', examenesControllers.saveScore);
router.post('/saveAnswers', examenesControllers.saveAnswers);

module.exports = router;