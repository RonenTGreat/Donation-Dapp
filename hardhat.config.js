require("@nomicfoundation/hardhat-toolbox");
const dotenv = require("dotenv");

dotenv.config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    mumbai: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${process.env.AlCHEMY_API_KEY}`,
      accounts: [`${process.env.PRIVATE_KEY}`]
    },
  },
};
