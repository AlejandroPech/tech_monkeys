import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tech_monkeys/src/models/datos_funcionamiento.dart';
import 'package:tech_monkeys/src/models/reporte_servicio.dart';
import 'package:tech_monkeys/src/models/servicio_correctivo.dart';
import 'package:tech_monkeys/src/models/servicio_preventivo.dart';
part 'funcionamiento_db.dart';
part 'preventivo_db.dart';
part 'correctivo_db.dart';

class ReporteServicioDataBase{
  static final ReporteServicioDataBase instance=ReporteServicioDataBase._init();
  
  static Database? _database;

  ReporteServicioDataBase._init();

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
  }

  Future<ReporteServicio> create(ReporteServicio reporte)async {
    final db= await instance.database;
    final id=await db.insert(tableReporte, ReporteServicio.toJson(reporte));
    reporte.id=id;
    reporte.datosFuncionamiento.reporteId=id;
    reporte.datosFuncionamiento=await _FuncionamientoDatabase.instance.create(reporte.datosFuncionamiento);
    return reporte;
  }

  Future<ReporteServicio> readReporte(int id)async{
    final db= await instance.database;

    final maps= await db.query(
      tableReporte,
      columns: ReporteFields.values,
      where: '${ReporteFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return ReporteServicio.fromJson(maps.first);
    }else{
      throw Exception('ID $id no encontrado');
    }
  }

  Future<List<ReporteServicio>> readAllReports()async {
    final db=await instance.database;

    final result= await db.query(tableReporte);
    return result.map((json) => ReporteServicio.fromJson(json)).toList();
  }

  Future<int> update(ReporteServicio servicio)async{
    final db=await instance.database;

    return db.update(
      tableReporte, 
      ReporteServicio.toJson(servicio),
      where: '${ReporteFields.id} = ?',
      whereArgs: [servicio.id],
    );
  }

  Future<int> delete(int id)async{
    final db= await instance.database;
    return await db.delete(
      tableReporte,
      where: '${ReporteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close()async{
    final db= await instance.database;
    db.close();
  }
}

