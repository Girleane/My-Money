import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String despesaTable = "despesaTable";
final String idColumn = "idColumn";
final String titleColumn = "titleColumn";
final String subtitleColumn = "subtitleColumn";
final String valueColumn = "valueColumn";
final String tipoColumn = "tipoColumn";

class DespesaHelper {
  static final DespesaHelper _instance = DespesaHelper.internal();

  factory DespesaHelper() => _instance;

  DespesaHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "despesas.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $despesaTable($idColumn INTEGER PRIMARY KEY, $titleColumn TEXT, $subtitleColumn TEXT, $valueColumn FLOAT, $tipoColumn TEXT)");
    });
  }

  Future<Despesa> saveDespesa(Despesa despesa) async {
    Database? dbDespesa = await db;
    despesa.id = await dbDespesa!.insert(despesaTable, despesa.toMap());
    return despesa;
  }

  Future<Despesa?> getDespesa(int id) async {
    Database? dbDespesa = await db;
    List<Map> maps = await dbDespesa!.query(despesaTable,
        columns: [
          idColumn,
          titleColumn,
          subtitleColumn,
          valueColumn,
          tipoColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Despesa.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteDespesa(int id) async {
    Database? dbDespesa = await db;
    return await dbDespesa!
        .delete(despesaTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateDespesa(Despesa despesa) async {
    Database? dbDespesa = await db;
    return await dbDespesa!.update(despesaTable, despesa.toMap(),
        where: "$idColumn = ?", whereArgs: [despesa.id]);
  }

  Future<List> getAllDespesas() async {
    Database? dbDespesa = await db;
    List listMap = await dbDespesa!.rawQuery("SELECT * FROM $despesaTable");
    List<Despesa> listDespesa = [];
    for (Map map in listMap) {
      listDespesa.add(Despesa.fromMap(map));
    }
    return listDespesa;
  }

  Future<List> getDespesasPorMes(String data) async {
    Database? dbDespesa = await db;
    List listMap = await dbDespesa!.rawQuery(
        "SELECT * FROM $despesaTable WHERE $subtitleColumn LIKE '%$data%'");
    List<Despesa> listDespesa = [];
    for (Map map in listMap) {
      listDespesa.add(Despesa.fromMap(map));
    }
    return listDespesa;
  }

  Future<int?> getNumber() async {
    Database? dbDespesa = await db;
    return Sqflite.firstIntValue(
        await dbDespesa!.rawQuery("SELECT COUNT(*) FROM $despesaTable"));
  }

  Future close() async {
    Database? dbDespesa = await db;
    dbDespesa!.close();
  }
}

class Despesa {
  int? id;
  String? title;
  String? subtitle;
  String? tipo;
  dynamic value;

  Despesa();

  Despesa.fromMap(Map map) {
    id = map[idColumn];
    title = map[titleColumn];
    subtitle = map[subtitleColumn];
    value = map[valueColumn];
    tipo = map[tipoColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      titleColumn: title,
      subtitleColumn: subtitle,
      valueColumn: value,
      tipoColumn: tipo,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Movimentação:(id:$id,title:$title,subtitle:$subtitle,value:$value, tipo:$tipo)";
  }
}
