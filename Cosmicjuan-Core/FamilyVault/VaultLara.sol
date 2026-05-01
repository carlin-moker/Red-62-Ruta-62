// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FamilyVaultLara {
    address public nodoMatriz;
    
    struct Heredero {
        bool autorizado;
        uint256 porcentajeAsignado;
        uint256 fechaAlta;
    }
    
    mapping(address => Heredero) public linaje;

    modifier soloElMen() {
        require(msg.sender == nodoMatriz, "Acceso denegado: Solo el Patron autoriza");
        _;
    }

    constructor() {
        nodoMatriz = msg.sender; // yefris19 asume el control
    }

    // Función para conectar a los nietos/hijos una vez que usen el Invite Link
    function registrarDescendencia(address _walletHeredero, uint256 _porcentaje) public soloElMen {
        linaje[_walletHeredero] = Heredero({
            autorizado: true,
            porcentajeAsignado: _porcentaje,
            fechaAlta: block.timestamp
        });
    }
}
