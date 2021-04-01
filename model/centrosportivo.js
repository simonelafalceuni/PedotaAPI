module.exports = (sequelize, Sequelize) => {
    const CentroSportivo = sequelize.define("centrosportivo", {
      Id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      Nome: {
        type: Sequelize.STRING
      }
    }, {
      timestamps: false,
      createdAt: false,
      updatedAt: false,
      initialAutoIncrement: 1,
      tableName: 'centrosportivo'
    });
  
    return CentroSportivo;
  };