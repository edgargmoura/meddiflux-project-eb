const AWS = require("aws-sdk");
AWS.config.update({ region: "us-east-1" });
const rds = new AWS.RDS({ apiVersion: "2016-11-15" });

const startDBCluster = async (evento) => {
  try {
    const parametros = {
      DBClusterIdentifier: "meddiflux-db-hom" // Substitua pelo nome correto do seu cluster
    };

    const dados = await rds.startDBCluster(parametros).promise();
    console.log("Cluster Aurora de homologação iniciado com sucesso", dados);
    return dados;
  } catch (erro) {
    console.error("Erro ao iniciar o cluster Aurora:", erro);
    throw erro;
  }
};


const stopDBCluster = async (evento) => {
  try {
    const parametros = {
      DBClusterIdentifier: "meddiflux-db-hom" // Substitua pelo nome correto do seu cluster
    };

    const dados = await rds.stopDBCluster(parametros).promise();
    console.log("Cluster Aurora de homologação parado com sucesso", dados);
    return dados;
  } catch (erro) {
    console.error("Erro ao parar o cluster Aurora:", erro);
    throw erro;
  }
};
module.exports = { startDBCluster, stopDBCluster};