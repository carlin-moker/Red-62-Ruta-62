// SPDX-License-Identifier: CosmicGlobal-Sovereign
pragma solidity ^0.8.20;

contract ConsensoCJB {
    address public propietario;
    uint256 public bloquesValidados;

    event BloqueValidado(uint256 indexed id, address indexed validator);

    modifier soloPropietario() {
        require(msg.sender == propietario, "Acceso restringido: Solo el propietario");
        _;
    }

    constructor() {
        propietario = msg.sender;
        bloquesValidados = 0;
    }

    function validarBloque() public soloPropietario {
        bloquesValidados++;
        emit BloqueValidado(bloquesValidados, msg.sender);
    }

    function obtenerBloquesValidados() public view returns (uint256) {
        return bloquesValidados;
    }
}
