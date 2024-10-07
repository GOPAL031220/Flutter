import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Repository{
  static Database? _database;
  Future<Database?> get database async{
    if(_database!=null) return _database;
    _database = await setDatabase();
    return _database;
  }
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,'Blood_Bank');
    var database = await openDatabase(path,version: 1,onCreate: _onCreatingDatabase);
    return database;
  }
  _onCreatingDatabase(Database database, int version) async{
    await database.execute("CREATE TABLE Donors(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,blood_group TEXT,contact TEXT,location TEXT)");
    await database.execute("CREATE TABLE Requests(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,blood_group TEXT,contact TEXT,location TEXT)");
  }   //database created


// query for Donors table
  insertDonor(table,data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }
  readDonorsData(table) async{
    var connection = await database;
    return await connection?.query(table);
  }
  deleteDonor(table,categoryId) async{
    var connection = await database;
    return await connection?.rawDelete('DELETE FROM $table WHERE id = $categoryId');
  }


  // query for Requests table
  insertRequest(table,data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }
  readRequestsData(table) async{
    var connection = await database;
    return await connection?.query(table);
  }
  deleteRequest(table,categoryId) async{
    var connection = await database;
    return await connection?.rawDelete('DELETE FROM $table WHERE id = $categoryId');
  }
}