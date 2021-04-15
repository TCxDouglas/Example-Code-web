var express = require('express');
var escolaresControllers = require('../controllers/escolares');

var router = express.Router();

router.get('/test', escolaresControllers.test);
router.get('/data', escolaresControllers.data);
router.post('/new', escolaresControllers.newUser);
router.get('/login/:email?/:pass?', escolaresControllers.login);

module.exports = router;