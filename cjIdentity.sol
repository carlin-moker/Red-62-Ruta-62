// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Cosmicjuan Identity & Registry Contract
 * @dev Propósito: Pilar de Identidad, Registro Criptofísico e IPFS.
 * Desarrollado para el ecosistema independiente Cosmicjuan.blockchain bajo protección divina.
 */
contract CjIdentity {
    
    address public immutable owner;
    
    // Identificadores nativos del ecosistema
    string public constant ID_CJ = "CJ";
    string public constant ID_CGL = "CGL";
    string public constant ID_CJB = "CJB";

    struct RegistroIPFS {
        string ipfsHash;
        uint256 timestamp;
        string descripcion;
        bool activo;
    }

    // Mapeos inmutables en tu nodo
    mapping(string => RegistroIPFS) private _registros;
    string[] private _listaClaves;

    event RegistroAnclado(string indexed clave, string ipfsHash, string descripcion);
    event RegistroRevocado(string indexed clave);

    modifier onlyOwner() {
        require(msg.sender == owner, "No autorizado: Solo el nucleo tecnico");
        _;
    }

    constructor() {
        owner = msg.sender; // Asigna el control absoluto a tu dirección de carlin-moker
    }

    /**
     * @notice Vincula un componente o archivo (como index.html) a la blockchain local.
     * @param clave Identificador único del componente (ej. "INDEX_PRINCIPAL")
     * @param _ipfsHash El hash CID proveniente de tu red IPFS
     * @param _descripcion Detalle constructivo del archivo
     */
    function anclarComponente(
        string memory clave, 
        string memory _ipfsHash, 
        string memory _descripcion
    ) public onlyOwner {
        require(bytes(_ipfsHash).length > 0, "Hash IPFS invalido");
        
        if (_registros[clave].timestamp == 0) {
            _listaClaves.push(clave);
        }

        _registros[clave] = RegistroIPFS({
            ipfsHash: _ipfsHash,
            timestamp: block.timestamp,
            descripcion: _descripcion,
            activo: true
        });

        emit RegistroAnclado(clave, _ipfsHash, _descripcion);
    }

    /**
     * @notice Consulta los datos exactos de un componente indexado.
     */
    function obtenerComponente(string memory clave) public view returns (
        string memory ipfsHash, 
        uint256 timestamp, 
        string memory descripcion, 
        bool activo
    ) {
        RegistroIPFS memory registro = _registros[clave];
        require(registro.timestamp > 0, "El componente no existe");
        return (registro.ipfsHash, registro.timestamp, registro.descripcion, registro.activo);
    }

    /**
     * @notice Desactiva un registro si evoluciona a una nueva versión física.
     */
    function revocarComponente(string memory clave) public onlyOwner {
        require(_registros[clave].timestamp > 0, "Inexistente");
        _registros[clave].activo = false;
        emit RegistroRevocado(clave);
    }

    /**
     * @notice Devuelve el número total de archivos e identidades ancladas.
     */
    function totalComponentes() public view returns (uint256) {
        return _listaClaves.length;
    }
}
