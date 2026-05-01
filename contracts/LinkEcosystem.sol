// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title LinkEcosystem
 * @dev Nucleo tecnico de CosmicGemLogistic. 
 * Copyright (c) 2026 Juan Martinez Lara (The Men)
 */

contract LinkEcosystem {
    string public name = "CosmicGemLogistic Core";
    address public owner;

    event LogDeployment(address indexed operator, string message);

    constructor() {
        owner = msg.sender;
        emit LogDeployment(owner, "Ecosistema Iniciado bajo Proteccion Divina");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "No autorizado");
        _;
    }

    function getStatus() public pure returns (string memory) {
        return "OPERATIVO - Red Soberana";
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LinkEcosystem {
    string public name = "CosmicGemLogistic Core";
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getStatus() public pure returns (string memory) {
        return "OPERATIVO - Red Soberana";
    }
}

