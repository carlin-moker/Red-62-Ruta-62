// SPDX-License-Identifier: CosmicGlobal-Sovereign
pragma solidity ^0.8.20;

/**
 * @title ConsensoCJB
 * @dev Contrato de consenso de bloques locales en Red-62
 * Token nativo: CJB
 */

contract ConsensoCJB {
    address public propietario;
    uint256 public bloquesValidados;

    event BloqueValidado(uint256 id, address validador);

    modifier soloPropietario() {
        require(msg.sender == propietario, "Solo el propietario puede ejecutar esta accion");
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
