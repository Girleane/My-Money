import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String receitaTable = "receitaTable";
final String idColumn = "idColumn";
final String titleColumn = "titleColumn";
final String subtitleColumn = "subtitleColumn";
final String valueColumn = "valueColumn";

class ReceitaHelper {

  static final ReceitaHelper _instance = ReceitaHelper.internal();

  factory ReceitaHelper() => _instance;

  ReceitaHelper.internal();

  Database?_db;

  Future<Database?> get db async {
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath,"receitas.db");

    return await openDatabase(path,version: 1,onCreate: (Database db,int newerVersion) async {
      await db.execute(
          "CREATE TABLE $receitaTable($idColumn INTEGER PRIMARY KEY, $titleColumn TEXT, $subtitleColumn TEXT, $valueColumn FLOAT)"
      );
    });
  }

  Future<Receita> saveReceita(Receita receita) async {
    Database? dbReceita = await db;
    receita.id = await dbReceita!.insert(receitaTable, receita.toMap());
    return receita;
  }

  Future<Receita?> getReceita(int id) async {
    Database? dbReceita = await db;
    List<Map> maps = await dbReceita!.query(receitaTable, columns: [idColumn, titleColumn, subtitleColumn, valueColumn], where: "$idColumn = ?",whereArgs: [id]);
    if(maps.length > 0){
      return Receita.fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<int> deleteReceita(int id) async {
    Database? dbReceita = await db;
    return await dbReceita!.delete(receitaTable, where: "$idColumn = ?",whereArgs: [id]);
  }

  Future<int> updateReceita(Receita receita) async {
    Database? dbReceita = await db;
    return await dbReceita!.update(receitaTable,receita.toMap(), where: "$idColumn = ?",whereArgs: [receita.id]);
  }

  Future<List> getAllDespesas() async {
    Database? dbReceita = await db;
    List listMap = await dbReceita!.rawQuery("SELECT * FROM $receitaTable");
    List<Receita> listReceita = [];
    for (Map map in listMap) {
      listReceita.add(Receita.fromMap(map));
    }
    return listReceita;
  }

  Future<List> getReceitasPorMes(String data) async {
    Database? dbReceita = await db;
    List listMap = await dbReceita!.rawQuery("SELECT * FROM $receitaTable WHERE $subtitleColumn LIKE '%$data%'");
    List<Receita> listReceita = [];
    for (Map map in listMap) {
      listReceita.add(Receita.fromMap(map));
    }
    return listReceita;
  }

  Future<int?> getNumber() async {
    Database? dbReceita = await db;
    return Sqflite.firstIntValue(await dbReceita!.rawQuery("SELECT COUNT(*) FROM $receitaTable"));
  }

  Future close() async {
    Database? dbReceita = await db;
    dbReceita!.close();
  }

}

class Receita {

  int? id;
  String? title;
  String? subtitle;
  dynamic value;

  Receita();

  Receita.fromMap(Map map){
    id = map[idColumn];
    title = map[titleColumn];
    subtitle = map[subtitleColumn];
    value = map[valueColumn];
  }

  Map<String,dynamic> toMap(){
    Map<String, dynamic> map = {
      titleColumn: title,
      subtitleColumn: subtitle,
      valueColumn: value!,
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Receita:(id:$id,title:$title,subtitle:$subtitle,value:$value)";
  }
}