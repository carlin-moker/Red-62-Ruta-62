// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CosmicJuan is ERC20 {
    constructor() ERC20("Cosmic Juan Token", "CJ") {
        // Esto crea 1,000,000 de tokens con 18 decimales
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
