const KVStorage = artifacts.require("KVStorage");

module.exports = function(deployer) {
  deployer.deploy(KVStorage, "morpheus-example-storage");
};
