// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CGL_Soberano_Snap
 * @dev Gestion de firmas off-chain y ejecucion para CosmicGemLogistic
 */
contract CGL_Soberano_Snap {
    address public owner;
    mapping(address => bool) public operadoresAutorizados;
    mapping(uint256 => bool) public noncesUtilizados;

    event AccionEjecutada(address indexed operador, uint256 idTarea);

    constructor() {
        owner = msg.sender;
    }

    modifier soloOwner() {
        require(msg.sender == owner, "No autorizado");
        _;
    }

    function autorizarOperador(address _operador) external soloOwner {
        operadoresAutorizados[_operador] = true;
    }

    /**
     * @dev Verifica firma y ejecuta accion de logistica
     * @param _idTarea Identificador unico de la carga
     * @param _firma Firma digital generada off-chain
     */
    function ejecutarCarga(uint256 _idTarea, bytes memory _firma) external {
        require(operadoresAutorizados[msg.sender], "Operador no activo");
        require(!noncesUtilizados[_idTarea], "Tarea ya procesada");
        
        bytes32 hashMensaje = keccak256(abi.encodePacked(_idTarea, msg.sender));
        bytes32 hashEtiquetado = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hashMensaje));
        
        address firmante = recuperarFirmante(hashEtiquetado, _firma);
        require(firmante == owner, "Firma de soberano invalida");

        noncesUtilizados[_idTarea] = true;
        emit AccionEjecutada(msg.sender, _idTarea);
    }

    function recuperarFirmante(bytes32 _hash, bytes memory _firma) internal pure returns (address) {
        require(_firma.length == 65, "Longitud de firma invalida");
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            r := mload(add(_firma, 32))
            s := mload(add(_firma, 64))
            v := byte(0, mload(add(_firma, 96)))
        }
        return ecrecover(_hash, v, r, s);
    }
}

