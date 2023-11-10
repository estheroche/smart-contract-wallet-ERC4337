import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.17",


  networks: {
    hardhat: {
      forking: {
        enabled: true,
        url: "https://eth-sepolia.g.alchemy.com/v2/2R27BiS46-cApx2okJmrowPrzyerNWHu",
      }
    },
    sepolia: {
      url: process.env.SEPOLIARPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY, process.env.PRIVATEKEY],
    }
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  },
};

export default config;
