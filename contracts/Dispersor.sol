// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DispersorCosmicJuan {
    address public owner;
    address[5] public nodos = [
        0x59A13C4be8674068F0B1961918D2E40EfDB571cd,
        0xe99A6D599C24ccC581bec565CFa037A46afFE05f,
        0x1a688665924da145393FDF77232ADEc784858337,
        0xf9c46e6c7d73419Ca11EB7350Ed079Fd2d5faBbf,
        0x571789bE8794cFf6f366F26395fD3AC49232B21D
    ];

    constructor() {
        owner = msg.sender;
    }

    function repartirEquitativo(address tokenAddress, uint256 montoTotal) external {
        IERC20 token = IERC20(tokenAddress);
        require(token.transferFrom(msg.sender, address(this), montoTotal), "Fallo deposito");
        uint256 pagoIndividual = montoTotal / 5;
        for(uint i=0; i<5; i++) {
            token.transfer(nodos[i], pagoIndividual);
        }
    }
}