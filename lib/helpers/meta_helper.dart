import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String metaTable = "metaTable";
final String idColumn = "idColumn";
final String valorInicialColumn = "valorInicialColumn";
final String valorMetaColumn = "valorMetaColumn";
final String previsaoColumn = "previsaoColumn";
final String nameColumn = "nameColumn";
final String descricaoColumn = "descricaoColumn";
final String imgColumn = "imgColumn";

final String doneColumn = "doneColumn";

class MetaHelper {
  static final MetaHelper _instance = MetaHelper.internal();

  factory MetaHelper() => _instance;

  MetaHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "metastree.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $metaTable($idColumn INTEGER PRIMARY KEY, $valorInicialColumn TEXT, $valorMetaColumn TEXT,"
          "$previsaoColumn TEXT, $nameColumn TEXT, $descricaoColumn TEXT, $imgColumn TEXT, $doneColumn TEXT)");
    });
  }

  Future<Meta> saveMeta(Meta meta) async {
    Database dbMeta = await db;
    meta.id = await dbMeta.insert(metaTable, meta.toMap());
    return meta;
  }

  Future<Meta> getMeta(int id) async {
    Database dbMeta = await db;
    List<Map> maps = await dbMeta.query(metaTable,
        columns: [
          idColumn,
          valorInicialColumn,
          valorMetaColumn,
          previsaoColumn,
          nameColumn,
          descricaoColumn,
          imgColumn,
          doneColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Meta.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteMeta(int id) async {
    Database dbMeta = await db;
    return await dbMeta
        .delete(metaTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateMeta(Meta meta) async {
    Database dbMeta = await db;
    return await dbMeta.update(metaTable, meta.toMap(),
        where: "$idColumn = ?", whereArgs: [meta.id]);
  }

  Future<List> getAllMetas() async {
    Database dbMeta = await db;
    List listMap = await dbMeta.rawQuery("SELECT * FROM $metaTable");
    List<Meta> listMeta = [];
    for (Map m in listMap) {
      listMeta.add(Meta.fromMap(m));
    }
    return listMeta;
  }

  Future<int> getNumber() async {
    Database dbMeta = await db;
    return Sqflite.firstIntValue(
        await dbMeta.rawQuery("SELECT COUNT(*) FROM $metaTable"));
  }

  Future close() async {
    Database dbMeta = await db;
    dbMeta.close();
  }
}

class Meta {
  int id;
  String name;
  String valorInicial;
  String valorMeta;
  String previsao;
  String descricao;
  String img;

  String done;

  Meta();

  Meta.fromMap(Map map) {
    id = map[idColumn];
    valorInicial = map[valorInicialColumn];
    valorMeta = map[valorMetaColumn];
    previsao = map[previsaoColumn];
    name = map[nameColumn];
    descricao = map[descricaoColumn];
    img = map[imgColumn];

    done = map[doneColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      valorInicialColumn: valorInicial,
      valorMetaColumn: valorMeta,
      previsaoColumn: previsao,
      nameColumn: name,
      descricaoColumn: descricao,
      imgColumn: img,

      doneColumn: done
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Meta(id: $id, valorInicial: $valorInicial, valorMeta: $valorMeta, "
        "previsão: $previsao, name: $name, descrição: $descricao, img: $img)";
  }
}