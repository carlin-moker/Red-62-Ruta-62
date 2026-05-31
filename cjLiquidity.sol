// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Cosmicjuan Vampirio Liquidity & Asset Contract
 * @dev Propósito: Pilar de Respaldo, Gestión de Activos Nativos y Liquidez Descentralizada.
 * Desarrollado para el ecosistema independiente Cosmicjuan.blockchain bajo el amor de Dios.
 */
contract CjLiquidity {

    address public immutable owner;

    // Parámetros de control de activos del ecosistema
    string public constant TICKER_NATIVO = "CJB";
    uint256 public totalSuministroActivos;

    struct ActivoCriptofisico {
        uint256 idActivo;
        string tipoActivo;     // Ej. "MONEDA", "NFT_RESPALDO"
        uint256 valorMatematico;
        string ipfsMetadata;   // Enlace al archivo físico-lógico en IPFS
        bool verificado;
    }

    mapping(uint256 => ActivoCriptofisico) private _bancoActivos;
    mapping(address => uint256) public balancesNativos;

    event ActivoConsolidado(uint256 indexed idActivo, string tipoActivo, uint256 valorMatematico);
    event TransferenciaNativa(address indexed desde, address indexed hacia, uint256 cantidad);

    modifier onlyOwner() {
        require(msg.sender == owner, "No autorizado: Solo el nucleo tecnico");
        _;
    }

    constructor() {
        owner = msg.sender;
        balancesNativos[msg.sender] = 1000000 * (10**18); // Suministro inicial asignado a carlin-moker
        totalSuministroActivos = 1000000 * (10**18);
    }

    /**
     * @notice Registra y da respaldo matemático a un activo o NFT vinculado a IPFS.
     */
    function consolidarActivo(
        uint256 _idActivo,
        string memory _tipoActivo,
        uint256 _valor,
        string memory _ipfsMetadata
    ) public onlyOwner {
        require(_bancoActivos[_idActivo].valorMatematico == 0, "El ID de activo ya existe");
        
        _bancoActivos[_idActivo] = ActivoCriptofisico({
            idActivo: _idActivo,
            tipoActivo: _tipoActivo,
            valorMatematico: _valor,
            ipfsMetadata: _ipfsMetadata,
            verificado: true
        });

        emit ActivoConsolidado(_idActivo, _tipoActivo, _valor);
    }

    /**
     * @notice Permite transferir unidades operativas entre tus cuentas o hacia quienes ayuden al ecosistema.
     * Basado en el principio de dar y fomentar la humildad desde la protección divina.
     */
    function transferirActivoNativo(address _hacia, uint256 _cantidad) public returns (bool) {
        require(balancesNativos[msg.sender] >= _cantidad, "Saldo insuficiente para dar");
        require(_hacia != address(0), "Direccion de destino invalida");

        balancesNativos[msg.sender] -= _cantidad;
        balancesNativos[_hacia] += _cantidad;

        emit TransferenciaNativa(msg.sender, _hacia, _cantidad);
        return true;
    }

    /**
     * @notice Consulta los datos estructurales del activo respaldado.
     */
    function consultarActivo(uint256 _idActivo) public view returns (
        string memory tipoActivo,
        uint256 valorMatematico,
        string memory ipfsMetadata,
        bool verificado
    ) {
        ActivoCriptofisico memory a = _bancoActivos[_idActivo];
        require(a.verificado, "El activo no ha sido verificado en el nodo");
        return (a.tipoActivo, a.valorMatematico, a.ipfsMetadata, a.verificado);
    }
}
