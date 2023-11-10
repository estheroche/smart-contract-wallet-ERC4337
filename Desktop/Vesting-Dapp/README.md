# Vesting Contract Dapp

This Solidity program is a full stack "Vesting contract" program that implements the factory contract model to allow individuals create a vesting contracts it has a frontend fully integrated with smart contracts.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract is a factory contract that deploys new instances of a child contract which individuals can use to create vesting plans on behalf of staffs or stakeholders, of their company,the contract implements a time lock system which prevents users from withdrawing vested tokens before the alloted unlock time.

## Functionalities Implemented

The contract implements the following features:

- Function that allows an organization to register themselves and their token
- Function that allows an Organization to be able to mention the type of stakeholder and their vesting period.
- Function that Organization should be able to whitelist addresses for certain stakeholders (founders, investors etc.).
- Whitelisted addresses should be able to claim their tokens after the vesting period.

## Live Url:



https://vesting-token-front-end.vercel.app/

### Contract Addresses

TokenContract:
https://sepolia.etherscan.io/address/0x99b3bca6b5d13464c2c986f220d7f962a5fce7bb

Organization Contract:
https://sepolia.etherscan.io/address/0x93136f5b0c6948716d6a4d8decd0bc1f8db585b9

## Authors
Esther Oche
[@metacraftersio](https://twitter.com/Estheroche1)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
