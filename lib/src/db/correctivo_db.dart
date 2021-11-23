part of 'reporte_servicio_db.dart';

class _CorrectivoDataBase {
  static final _CorrectivoDataBase instance=_CorrectivoDataBase._init();
  
  static Database? _database;

  _CorrectivoDataBase._init();

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