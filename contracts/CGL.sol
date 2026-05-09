// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CosmicGemLogistic
 * @dev Núcleo de control para Red 62.
 */
contract CosmicGemLogistic {
    address public immutable MAGNATE;
    uint256 public slashingRate; 
    bool public ddosProtected;

    struct Carga {
        uint256 id;
        string ruta;
        uint256 peso;
        bool entregado;
    }

    mapping(uint256 => Carga) public bitacora;

    event CargaRegistrada(uint256 id, string ruta);
    event AlertaSeguridad(string motivo, uint256 timestamp);

    modifier soloMagnate() {
        require(msg.sender == MAGNATE, "Error: Solo el Magnate tiene el mando");
        _;
    }

    constructor(uint256 _slashingRate, bool _ddosProtected) {
        MAGNATE = msg.sender;
        slashingRate = _slashingRate;
        ddosProtected = _ddosProtected;
    }

    function registrarViaje(uint256 _id, string memory _ruta, uint256 _peso) public soloMagnate {
        bitacora[_id] = Carga(_id, _ruta, _peso, false);
        emit CargaRegistrada(_id, _ruta);
    }

    function activarSlashing() public soloMagnate {
        emit AlertaSeguridad("Penalizacion aplicada segun protocolo Red 62", block.timestamp);
    }
}
