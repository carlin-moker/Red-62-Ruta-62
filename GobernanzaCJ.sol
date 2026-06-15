// SPDX-License-Identifier: CosmicGlobal-Sovereign
pragma solidity ^0.8.20;

/**
 * @title GobernanzaCJ
 * @dev Contrato de gobernanza para Red-62 / Cosmicjuan.blockchain
 * Token nativo: CJ
 */

contract GobernanzaCJ {
    address public propietario;
    mapping(address => uint256) public votos;
    mapping(string => uint256) public propuestas;

    event PropuestaCreada(string propuesta);
    event VotoEmitido(address votante, string propuesta);

    modifier soloPropietario() {
        require(msg.sender == propietario, "Solo el propietario puede ejecutar esta accion");
        _;
    }

    constructor() {
        propietario = msg.sender;
    }

    function crearPropuesta(string memory nombre) public soloPropietario {
        propuestas[nombre] = 0;
        emit PropuestaCreada(nombre);
    }

    function votar(string memory nombre) public {
        require(propuestas[nombre] >= 0, "Propuesta inexistente");
        votos[msg.sender]++;
        propuestas[nombre]++;
        emit VotoEmitido(msg.sender, nombre);
    }

    function obtenerPropuesta(string memory nombre) public view returns (uint256) {
        return propuestas[nombre];
    }
}
