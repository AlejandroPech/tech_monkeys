part of 'reporte_servicio_db.dart';


class _FuncionamientoDatabase {
   static final _FuncionamientoDatabase instance=_FuncionamientoDatabase._init();
  
  static Database? _database;

  _FuncionamientoDatabase._init();

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
    const intType='INTEGER';
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
  }

  Future<DatosFuncionamiento> create(DatosFuncionamiento funcionamiento)async {
    final db= await instance.database;
    final id=await db.insert(tableFuncionamiento, DatosFuncionamiento.toJson(funcionamiento));
    funcionamiento.id=id;
    return funcionamiento;
  }
  
  Future close()async{
    final db= await instance.database;
    db.close();
  }
}