
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Banco {

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/users.json");
  }

  Future<String?> readData() async {
    try {
      final file = await getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
  Future<File> saveData(var user) async {
    String data = json.encode(user);
    File file = await getFile();

    return file.writeAsString(data);
  }
}


