'use strict';
var express = require('express');
var router = express.Router();

/* GET campi listing. */
router.get('/', function (req, res) {
    var campi = [{
        nome: "Campo1",
        codice: "AAA"
    }, {
        nome: "Campo2",
        codice: "AAB"
    }]

    res.json(campi);
});

module.exports = router;
