// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Cosmicjuan {
    string public name = "Cosmicjuan Token";
    string public symbol = "CJ";
    uint256 public totalSupply = 1000000 * 10**18;
    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }
}
