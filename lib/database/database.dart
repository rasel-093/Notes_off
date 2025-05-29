import 'dart:ffi';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Note.dart';

class SqfliteDatabase{
  static late Database _database;
  static Future<Database> initialiseDatabase() async{
    Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String dbPath = applicationDirectory.path + "/notes.db";
    _database = await openDatabase(dbPath, version: 1, onCreate: (db, version) async{
      await db.execute("CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, time INTEGER)");
    });
    return _database;
  }

  static Future<List<Note>> getDataFromDatabase() async{
    final result = await _database.query("Notes");
    List<Note> notes = result.map((e) => Note.fromJson(e)).toList();
    return notes;
  }
  static Future<void> insertDataIntoDatabase(Note note) async{
    await _database.insert("Notes", note.toJson());
  }
  static Future<void> deleteDataFromDatabase(int time) async{
    await _database.delete("Notes", where: "time = ?", whereArgs: [time]);
  }
  static Future<void> updateDataFromDatabase(Note note) async{
    await _database.update("Notes", note.toJson(), where: "time = ?", whereArgs: [note.time]);
  }
}
