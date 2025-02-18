import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  // Initialize the database
  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('Database is already initialized');
      return;
    }

    try {
      String _path = await getDatabasesPath() + '/task.db';
      debugPrint('Database path: $_path');
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (Database db, int version) async {
          debugPrint('Creating a new database');
          await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title STRING,
              note TEXT,
              date STRING,
              startTime STRING,
              endTime STRING,
              remind INTEGER,
              repeat STRING,
              color INTEGER,
              isCompleted INTEGER
            )
          ''');
        },
      );
      debugPrint('Database initialized');
    } catch (e) {
      debugPrint('Error during database initialization: $e');
    }
  }

  
static Future<int> insert(Task? task) async {  
  print('insert function called');  
  return await _db!.insert(_tableName, task!.toJson());  
}  
 
 static Future<int> delete(Task task) async {  
  print('delete');  
  return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);  
}


static Future<int> deleteAll() async {  
    print('delete All function called');  
    return await _db!.delete(_tableName);  
} 
 
 static Future<int> update(int id) async {  
  print('Update');  
  return await _db!.rawUpdate('''  
    UPDATE tasks  
    SET isCompleted = ?  
    WHERE id = ?  
  ''', [1, id]);  
} 


static Future<List<Map<String, dynamic>>> query() async {  
  print('query function called');  
  return await _db!.query(_tableName);  
} 

 
}
