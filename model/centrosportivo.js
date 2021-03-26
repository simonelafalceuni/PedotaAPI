module.exports = (sequelize, Sequelize) => {
    const CentroSportivo = sequelize.define("centrosportivo", {
      Id: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      Nome: {
        type: Sequelize.STRING
      }
    }, {
      tableName: 'centrosportivo'
    });
  
    return CentroSportivo;
  };