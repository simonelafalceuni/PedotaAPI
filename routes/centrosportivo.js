'use strict';
var express = require('express');
var router = express.Router();

const db = require("../model/init");
const centrisportivi = db.centrisportivi;

/* GET campi listing. */
router.get('/', function (req, res) {

    var req_nome = req.query.nome;
    var where = {};

    if(req_nome){
      where["Nome"] = req_nome
    }

    //Perchè usiamo un ORM? L'alternativa sarebbe fare query dirette sul database, scrivendo query testuali
    // SQLCLient c = new SQLClient();
    // var response = c.excuteQuery("SELECT * FROM WHERE <condizioni di filtro>");
    // var CentroSportivo = response.map(..)

    //AWAIT A PROMISE in alternativa al then
    // var query_response = await centrisportivi.findAll(
    //   {
    //       attributes: ['Id', 'Nome'],
    //       where: where
    //   },
    // );

    centrisportivi.findAll(
    {
        attributes: ['Id', 'Nome'],
        where: where
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

router.get('/:id', function (req, res) {
  centrisportivi.findByPk(req.params.id, {attributes: ['Id', 'Nome']})
   .then(data => {
     if(data)
      res.send(data);
      res.status(404).send()
   })
   .catch(err => {
     res.status(501).send({
       message:
         err.message || "Some error occurred while retrieving CentroSportivo."
     });
   });
});

router.post('/', function (req, res) {
  var body = req.body;
  //TODO: Eventuali VALIDAZIONI sul body in input

  centrisportivi.create({
    Nome: body.Nome
  }, { fields: ['Id','Nome']}).then(data => {
    if(data)
     res.status(201).send()
  })
  .catch(err => {
    console.log(err)
    res.status(501).send({
      message:
        err.message || "Some error occurred while creating CentroSportivo."
    });
  });
});

router.put('/', function (req, res) {
  let body = req.body;

  centrisportivi.findByPk(body.Id, {attributes: ['Id', 'Nome']})
   .then(data => {
     if(data && data.Id){
      centrisportivi.update({ Nome: body.Nome }, {
        fields: ['Id','Nome'],
        where: {
          Id: body.Id
        }
      }).then(data => {
        if(data)
         res.status(200).send()
      })
      .catch(err => {
        console.log(err)
        res.status(501).send({
          message:
            err.message || "Some error occurred while creating CentroSportivo."
        });
      });
     }else res.status(404).send()
   })
   .catch(err => {
     res.status(501).send({
       message:
         err.message || "Some error occurred while retrieving CentroSportivo."
     });
   });

});

router.delete('/', function (req, res) {
  res.send("DELETE");
});

module.exports = router;
