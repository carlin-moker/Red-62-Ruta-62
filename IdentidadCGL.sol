// SPDX-License-Identifier: CosmicGlobal-Sovereign
pragma solidity ^0.8.20;

/**
 * @title IdentidadCGL
 * @dev Contrato de identidad y logística en Red-62
 * Token nativo: CGL
 */

contract IdentidadCGL {
    address public propietario;

    struct Identidad {
        string nombre;
        string rol;
        bool activa;
    }

    mapping(address => Identidad) public identidades;

    event IdentidadRegistrada(address cuenta, string nombre, string rol);
    event IdentidadActivada(address cuenta);
    event IdentidadDesactivada(address cuenta);

    modifier soloPropietario() {
        require(msg.sender == propietario, "Solo el propietario puede ejecutar esta accion");
        _;
    }

    constructor() {
        propietario = msg.sender;
    }

    function registrarIdentidad(address cuenta, string memory nombre, string memory rol) public soloPropietario {
        identidades[cuenta] = Identidad(nombre, rol, true);
        emit IdentidadRegistrada(cuenta, nombre, rol);
    }

    function activarIdentidad(address cuenta) public soloPropietario {
        identidades[cuenta].activa = true;
        emit IdentidadActivada(cuenta);
    }

    function desactivarIdentidad(address cuenta) public soloPropietario {
        identidades[cuenta].activa = false;
        emit IdentidadDesactivada(cuenta);
    }

    function obtenerIdentidad(address cuenta) public view returns (Identidad memory) {
        return identidades[cuenta];
    }
}
