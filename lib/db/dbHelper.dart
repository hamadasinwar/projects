import 'package:flutter_app/models/tasks.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DBHelper{
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final String databaseName = "tasksDB";
  static final String tasksTableName = "tasks";
  static final String tasksID = "id";
  static final String tasksName = "name";
  static final String isCompleteTasks = "isComplete";
  Database database;
  Future<Database> initDatabase()async{
    if(database == null){
      database = await createDatabase();
      return database;
    }else{
      return database;
    }
  }

  Future <Database> createDatabase()async{
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      Database database = await openDatabase(path, version: 2, onCreate: (db, version){
        db.execute('''CREATE TABLE $tasksTableName(
          $tasksID INTEGER PRIMARY KEY AUTOINCREMENT,
          $tasksName TEXT NOT NULL,
          $isCompleteTasks INTEGER
          );''');
      });
      return database;
    } on Exception catch (e) {
      print("Error "+e.toString());
      return null;
    }
  }
  insertNewTask(Task tasks)async{
    try {
      database = await initDatabase();
      var x = await database.insert(tasksTableName, tasks.toJSON());
      print(x);
    } on Exception catch (e) {
      print("Error "+e.toString());
    }
  }
  Future<List<Task>> selectAllTasks()async{
    try {
      database = await initDatabase();
      var r = await database.query(tasksTableName);
      List<Task> allTasks = r.isNotEmpty ? r.map((e) => Task.fromMap(e)).toList():[];
      allTasks.forEach((element) {
        print("${element.name} ${element.isComplete}");
      });
      return allTasks;
    } on Exception catch (e) {
      print("Error!!!!!!!!! "+e.toString());
      return null;
    }
  }
  Future<List<Map>> selectTask(String name)async{
    try {
      database = await initDatabase();
      List<Map> tasks = await database.query(tasksTableName, where: '$tasksName=?', whereArgs: [name]);
      print(tasks);
      return tasks;
    } on Exception catch (e) {
      print("Error "+e.toString());
      return null;
    }
  }
  updateTask(String name, Task tasks)async{
    try {
      database = await initDatabase();
      var x = await database.update(tasksTableName, tasks.toJSON(), where: '$tasksName=?', whereArgs: [name]);
      print(x);
    } on Exception catch (e) {
      print("Error "+e.toString());
    }
  }
  deleteTask(String name)async{
    try {
      database = await initDatabase();
      var x = await database.delete(tasksTableName, where: '$tasksName=?', whereArgs: [name]);
      print(x);
    } on Exception catch (e) {
      print("Error "+e.toString());
    }
  }

}