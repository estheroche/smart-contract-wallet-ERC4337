# Smart contract Wallet Account Abstraction (ERC4337)

This project uses `ERC4337` standard to create Smart wallet for a user and also has functionalities that allows users to deposit funds, receive Fund, and view the Balance

## Table of Contents

- [Smart contract Wallet Account Abstraction (ERC4337)](#smart-contract-wallet-account-abstraction-erc4337)
  - [Table of Contents](#table-of-contents)
  - [Overview-Description](#overview-description)
  - [Walk-Through Video](#walk-through-video)
  - [Deploying and Verifying the Contracts on Sepolia testnet](#deploying-and-verifying-the-contracts-on-sepolia-testnet)
  - [Frontend UI](#frontend-ui)
  - [Authors](#authors)
  - [License](#license)

## Overview-Description

The project uses a `WalletFactory`, to create a smart contract `Wallet` for every user who wants to Create a Wallet.
The factory contract deploys instances of the child contract to create wallet for each user

The `Smart Wallet Dapp`, allows you to create smart wallets. It has a factory contract that spurns smart wallets for users. This smart wallet is tie to a user EOA, thus a user can deposit funds into it, send out funds to any wallet as well as view the user's balance.

## Walk-Through Video
https://www.loom.com/share/bba2004b999a46e3a0962deaf1a771ec?sid=a8731eba-863c-4e3a-9069-edd1ad3ea898

## Deploying and Verifying the Contracts on Sepolia testnet

- ![01](./images/01.png)

- ![02](./images/02.png)

- ![03](./images/03.png)

- ![04](./images/04.png)

- ![05](./images/05.png)

- ![05](./images/05.png)

## Frontend UI

- ![08](./images/08.png)

- ![06](./images/06.png)

- ![07](./images/07.png)

## Authors
[@metacraftersio]()

[Oche Esther](https://twitter.com/Estheroche1)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
