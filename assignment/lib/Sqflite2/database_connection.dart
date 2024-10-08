import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class DatabaseConnection{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,'Task_list');
    var database = await openDatabase(path,version: 1,onCreate: _onCreatingDatabase);
    return database;
  }
  _onCreatingDatabase(Database database, int version) async{

    await database.execute("CREATE TABLE Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,description TEXT,date DATE,time TIME,priority TEXT,is_complete INTEGER DEFAULT 0)");

  }
}