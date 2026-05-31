// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Cosmicjuan Shadow Relayer Contract
 * @dev Propósito: Pilar de Carga, Transmisión y Relevo de datos entre dispositivos.
 * Desarrollado para el ecosistema independiente Cosmicjuan.blockchain bajo protección divina.
 */
contract CjRelayer {

    address public immutable owner;

    struct Transmision {
        uint256 idPaquete;
        string tipoCarga;     // Ej. "LOGISTICA", "TELEMETRIA", "SISTEMA"
        bytes datosCifrados;  // Carga útil protegida
        uint256 bloqueRegistro;
        bool procesado;
    }

    // Control de dispositivos autorizados del ecosistema (Tus 3 dispositivos)
    mapping(address => bool) public dispositivosAutorizados;
    
    // Historial de transmisiones del Relayer
    mapping(uint256 => Transmision) private _bitacora;
    uint256 public totalPaquetes;

    event CargaTransmitida(uint256 indexed idPaquete, address indexed emisor, string tipoCarga);
    event CargaProcesada(uint256 indexed idPaquete, address indexed receptor);
    event DispositivoModificado(address indexed dispositivo, bool estado);

    modifier onlyOwner() {
        require(msg.sender == owner, "No autorizado: Solo el nucleo tecnico");
        _;
    }

    modifier soloDispositivos() {
        require(dispositivosAutorizados[msg.sender] || msg.sender == owner, "Dispositivo no autenticado");
        _;
    }

    constructor() {
        owner = msg.sender;
        dispositivosAutorizados[msg.sender] = true; // El operador principal carlin-moker queda activo
    }

    function administrarDispositivo(address _dispositivo, bool _estado) public onlyOwner {
        dispositivosAutorizados[_dispositivo] = _estado;
        emit DispositivoModificado(_dispositivo, _estado);
    }

    /**
     * @notice Registra y propaga una carga de datos o estado en la infraestructura local.
     */
    function transmitirCarga(string memory _tipoCarga, bytes memory _datos) public soloDispositivos returns (uint256) {
        totalPaquetes++;
        
        _bitacora[totalPaquetes] = Transmision({
            idPaquete: totalPaquetes,
            tipoCarga: _tipoCarga,
            datosCifrados: _datos,
            bloqueRegistro: block.number,
            procesado: false
        });

        emit CargaTransmitida(totalPaquetes, msg.sender, _tipoCarga);
        return totalPaquetes;
    }

    /**
     * @notice Confirma la recepción y procesamiento de la carga por otro componente del nodo.
     */
    function procesarCarga(uint256 _idPaquete) public soloDispositivos {
        require(_bitacora[_idPaquete].bloqueRegistro > 0, "Paquete inexistente");
        require(!_bitacora[_idPaquete].procesado, "El paquete ya fue procesado");

        _bitacora[_idPaquete].procesado = true;
        emit CargaProcesada(_idPaquete, msg.sender);
    }

    /**
     * @notice Consulta externa de la bitácora de transmisión.
     */
    function consultarCarga(uint256 _idPaquete) public view returns (
        string memory tipoCarga,
        bytes memory datosCifrados,
        uint256 bloqueRegistro,
        bool procesado
    ) {
        Transmision memory t = _bitacora[_idPaquete];
        require(t.bloqueRegistro > 0, "Inexistente");
        return (t.tipoCarga, t.datosCifrados, t.bloqueRegistro, t.procesado);
    }
}
