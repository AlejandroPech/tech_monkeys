part of 'reporte_servicio_db.dart';

class _DatabaseReportes {
  static final _DatabaseReportes instance=_DatabaseReportes._init();
  
  static Database? _database;

  _DatabaseReportes._init();

  Future<Database> get database async{
    if(_database!= null) return _database!;

    _database = await _initDB('reportes.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath)async {
    final dbPath= await getDatabasesPath();
    final path=join(dbPath,filePath);

    return await openDatabase(path,version: 1,onCreate: _createDB );
  }

  Future _createDB(Database db, int version)async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const blobType = 'BLOB';
    const boolType = 'BOOLEAN NOT NULL';
    const intType='INTEGER';
    await db.execute('''
    CREATE TABLE $tableReporte (
      ${ReporteFields.id} $idType,
      ${ReporteFields.cliente} $textType,
      ${ReporteFields.ubicacion} $textType,
      ${ReporteFields.tipoEquipo} $textType,
      ${ReporteFields.mantenimiento} $textType,
      ${ReporteFields.fecha} $textType,
      ${ReporteFields.marca} $textType,
      ${ReporteFields.modelo} $textType,
      ${ReporteFields.numSerie} $textType,
      ${ReporteFields.descripcion} $textType,
      ${ReporteFields.tipo} $textType,
      ${ReporteFields.signatureCustomer} $blobType,
      ${ReporteFields.signatureTecnico} $blobType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableFuncionamiento (
      ${FuncionamientoFields.id} $idType,
      ${FuncionamientoFields.compresor1} $textType,
      ${FuncionamientoFields.compresor2} $textType,
      ${FuncionamientoFields.ventCond1} $textType,
      ${FuncionamientoFields.ventCond2} $textType,
      ${FuncionamientoFields.blower} $textType,
      ${FuncionamientoFields.estadoAspas} $textType,
      ${FuncionamientoFields.nivelAceite} $textType,
      ${FuncionamientoFields.resistenciaCarter1} $textType,
      ${FuncionamientoFields.resistenciaCarter2} $textType,
      ${FuncionamientoFields.presionCondensacion} $textType,
      ${FuncionamientoFields.temperaturaCondensacion} $textType,
      ${FuncionamientoFields.temperaturaSaturacion} $textType,
      ${FuncionamientoFields.subEnfriamiento} $textType,
      ${FuncionamientoFields.presionEvaporacion} $textType,
      ${FuncionamientoFields.temperatura} $textType,
      ${FuncionamientoFields.temperaturaSaturacion2} $textType,
      ${FuncionamientoFields.sobreCalentamiento} $textType,
      ${FuncionamientoFields.observaciones} $textType,
      ${FuncionamientoFields.reporteId} $intType,
      FOREIGN KEY(${FuncionamientoFields.reporteId}) REFERENCES $tableReporte(_id)
    )
    ''');

    await db.execute('''
    CREATE TABLE $tablePreventivo (
      ${PreventivoFields.id} $idType,
      ${PreventivoFields.lavadoCondensador} $boolType,
      ${PreventivoFields.limpAjusteCompElectrico} $boolType,
      ${PreventivoFields.insAjustePotencia} $boolType,
      ${PreventivoFields.limpBandejaDrenaje} $boolType,
      ${PreventivoFields.verificarSetPoint} $boolType,
      ${PreventivoFields.revAislamientoDuctos} $boolType,
      ${PreventivoFields.revCompElectrico} $boolType,
      ${PreventivoFields.verificarConexElectrico} $boolType,
      ${PreventivoFields.verifEstructuraEquipo} $boolType,
      ${PreventivoFields.lavadoEvaporador} $boolType,
      ${PreventivoFields.limpRejillaDifusores} $boolType,
      ${PreventivoFields.lavadoFiltroAireEvaporadr} $boolType,
      ${PreventivoFields.ajusteCargaRefrig} $boolType,
      ${PreventivoFields.revBalAspas} $boolType,
      ${PreventivoFields.revMotorEvaporador} $boolType,
      ${PreventivoFields.revMotorCondensador} $boolType,
      ${PreventivoFields.balanceVoltaje} $boolType,
      ${PreventivoFields.balanceTurbinaChamaquera} $boolType,
      ${PreventivoFields.peinarAletasSerpentines} $boolType,
      ${PreventivoFields.otraActividad} $textType,
      ${PreventivoFields.reporteId} $intType,
      FOREIGN KEY(${PreventivoFields.reporteId}) REFERENCES $tableReporte(_id)
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableCorrectivo (
      ${CorrectivoFields.id} $idType,
      ${CorrectivoFields.cambioCondensador} $boolType,
      ${CorrectivoFields.cambioAjusteCompElectrico} $boolType,
      ${CorrectivoFields.cambioAjusteTransPotencia} $boolType,
      ${CorrectivoFields.cambioAjusteBandDrenaje} $boolType,
      ${CorrectivoFields.cambioRodamientos} $boolType,
      ${CorrectivoFields.recurepaRefrigerante} $boolType,
      ${CorrectivoFields.correccionFuga} $boolType,
      ${CorrectivoFields.presurizadoNitrogeno} $boolType,
      ${CorrectivoFields.vacioMicrones} $boolType,
      ${CorrectivoFields.cargaRefrigerante} $boolType,
      ${CorrectivoFields.cambioEvaporador} $boolType,
      ${CorrectivoFields.cambioAjusteRejillas} $boolType,
      ${CorrectivoFields.cambioFiltroAireEvaporador} $boolType,
      ${CorrectivoFields.ajusteCargaRefrigerante} $boolType,
      ${CorrectivoFields.cambioBalanceoAspas} $boolType,
      ${CorrectivoFields.cambioAspasCondensador} $boolType,
      ${CorrectivoFields.cambioMotorCondensador} $boolType,
      ${CorrectivoFields.cambioMotorEvaporador} $boolType,
      ${CorrectivoFields.cambioCompresorFiltro} $boolType,
      ${CorrectivoFields.cambioComponenteElectrico} $boolType,
      ${CorrectivoFields.otraActividad} $textType,
      ${CorrectivoFields.reporteId} $intType,
      FOREIGN KEY(${CorrectivoFields.reporteId}) REFERENCES $tableReporte(_id)
    )
    ''');
  }
}