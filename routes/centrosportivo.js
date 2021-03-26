'use strict';
var express = require('express');
var router = express.Router();

const db = require("../model/init");
const centrisportivi = db.centrisportivi;

/* GET campi listing. */
router.get('/', function (req, res) {

    var req_nome = req.query.nome;

    centrisportivi.findAll(
    {
        attributes: ['Id', 'Nome'],
        where: {
            Nome: req_nome
        }
    },
    )
   .then(data => {
     res.send(data);
   })
   .catch(err => {
     res.status(501).send({
       message:
         err.message || "Some error occurred while retrieving CentroSportivo."
     });
   });
});

module.exports = router;
