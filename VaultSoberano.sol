// SPDX-License-Identifier: Private-Propiedad-Prohibida
pragma solidity ^0.8.19;

contract VaultSoberano {
    address public magnate;
    mapping(address => bool) public herederos;

    constructor() {
        magnate = msg.sender; // Tú eres el único dueño al desplegar
    }

    modifier soloMagnate() {
        require(msg.sender == magnate, "Proteccion Divina: Acceso Denegado");
        _;
    }

    function registrarHeredero(address _heredero) public soloMagnate {
        herederos[_heredero] = true;
    }

    // Funcion para depositar activos de la familia
    receive() external payable {}

    function retirarFondo(uint _cantidad) public {
        require(msg.sender == magnate || herederos[msg.sender], "No autorizado");
        payable(msg.sender).transfer(_cantidad);
    }
}
