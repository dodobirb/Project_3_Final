# Project_3_Final
FinTech Boot Camp Project 3: Smart contract loan with [future] NFT collateral

---

The return to private, decentralized peer-to-peer transactions was one of the founding pillars upon which blockchain technology was built. As financial technology continues to reshape "business as usual", smart contracts have become the most popular resource for new takes on existing practices. NFTs have also enjoyed a rise in popularity and mainstream recognition, though practical applications outside of collecting and gaming are few at this time. 

The goal of this project is to combine the non-fungibility of NFTs with the need for smart contract-embedded collateral in the case of a standard loan. Currently, the contract does not reflect this, as ETH is traded for ETH with ETH collateral. In the coming weeks, this contract will be completed and hold a NFT as collateral and dispense a stablecoin token to the borrower.

---

## Technologies

This smart contract was written on a Windows 10 machine in the Solidity language. It is compileable in versions 0.5.0 and above, as indicated in the first line of executable code. The second line denotes the requirement by the contructor's **Terms** type on line 34, position 17.

```
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

// Code Generator: New ABI decoder which supports structs and arbitrarily nested arrays and checks input size.
```

The mock local blockchain that this contract runs on is Ganache. The addresses used are from its list of local mock wallets.

* [Ganache](https://trufflesuite.com/docs/ganache/index.html) is a personal blockchain for rapid Ethereum and Corda distributed application development. You can use Ganache across the entire development cycle; enabling you to develop, deploy, and test your dApps in a safe and deterministic environment. In this case, it was used to generate Ethereum-connected mock accounts with which to mimic transactions. All versions of Ganache are available for Windows, Mac, and Linux.

The contract's contents were developed in the online Remix IDE for its contained deployment and testing features.

* [Remix IDE](https://remix-ide.readthedocs.io/en/latest/) is an open source web and desktop application. It fosters a fast development cycle and has a rich set of plugins with intuitive GUIs. Remix is used for the entire journey of contract development as well as act as a playground for learning and teaching Ethereum.

The selected environment for deployment is the LavaScript VM (London).

* [JavaScript VM](https://vide-old.readthedocs.io/en/latest/quickstart_javascript_vm.html) is one of the 3 environments Remix can be plugged to. The JavaScript VM mode is convenient because each execution runs in your browser. Thus reloading the page will restart Remix with an empty state. The other two options, *Injected provider* and *Web3 provider*, both require the use of an external tool. (The external tool for *Web3 provider* is an Ethereum node, the tools for *Injected provider* are Mist or Metamask.)

---

## Contributors

Brought to you by Erin Kenny, my last contribution for UNCC / Trilogy Ed. FinTech Boot Camp.

[Email](ekenny3@uncc.edu)

[LinkedIn](www.linkedin.com/in/e-kenny)

---

## License

MIT

License file included in repository.