var SOMCoin = artifacts.require("SOMCoin");
var UnlockVault = artifacts.require("UnlockVault");
var CarbonLoan =artifacts.require("CarbonLoan");

module.exports = function(deployer) {
    deployer.deploy(SOMCoin);
    deployer.deploy(UnlockVault);
    deployer.deploy(CarbonLoan);
};
