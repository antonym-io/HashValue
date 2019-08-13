const HashValue = artifacts.require("HashValue");
const truffleAssert = require('truffle-assertions');

const hashData1 = "0xff51e3d4ccd042d2d4972a07e076f5bf780ad3492c7df0f8aa22f210ee7b5b91";

contract("HashValue", accounts => {
  console.log("Accounts: " + JSON.stringify(accounts))
  it("should register the hash", () =>
    HashValue.deployed()
      .then(async (instance) => {
        await instance.addHash(hashData1);
        return instance;
      })
      .then( instance => {
        return instance.isRegistered(hashData1);
      })
      .then( registered => {
        assert.isTrue(registered, "hash wasn't registered");
      })
      );
});


