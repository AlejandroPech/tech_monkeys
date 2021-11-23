part of 'reporte_servicio_db.dart';

class _PreventivoDataBase {
  static final _PreventivoDataBase instance=_PreventivoDataBase._init();
  
  static Database? _database;

  _PreventivoDataBase._init();

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
    const boolType = 'BOOLEAN NOT NULL';
    const intType='INTEGER';
    await db.execute('''
    CREATE TABLE $tablePreventivo (
      ${PreventivoFields.id} $idType
      ${PreventivoFields.lavadoCondensador} $boolType
      ${PreventivoFields.limpAjusteCompElectrico} $boolType
      ${PreventivoFields.insAjustePotencia} $boolType
      ${PreventivoFields.limpBandejaDrenaje} $boolType
      ${PreventivoFields.verificarSetPoint} $boolType
      ${PreventivoFields.revAislamientoDuctos} $boolType
      ${PreventivoFields.revCompElectrico} $boolType
      ${PreventivoFields.verificarConexElectrico} $boolType
      ${PreventivoFields.verifEstructuraEquipo} $boolType
      ${PreventivoFields.lavadoEvaporador} $boolType
      ${PreventivoFields.limpRejillaDifusores} $boolType
      ${PreventivoFields.lavadoFiltroAireEvaporadr} $boolType
      ${PreventivoFields.ajusteCargaRefrig} $boolType
      ${PreventivoFields.revBalAspas} $boolType
      ${PreventivoFields.revMotorEvaporador} $boolType
      ${PreventivoFields.revMotorCondensador} $boolType
      ${PreventivoFields.balanceVoltaje} $boolType
      ${PreventivoFields.balanceTurbinaChamaquera} $boolType
      ${PreventivoFields.peinarAletasSerpentines} $boolType
      ${PreventivoFields.otraActividad} $textType
      ${PreventivoFields.reporteId} $intType
      FOREIGN KEY(${PreventivoFields.reporteId}) REFERENCES $tableReporte(_id)
    )
    ''');
  }
}