import 'package:food_delivery/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper{
  static Database? _db;

  Future<Database?> get db async{
    if(_db != null){
      return _db!;
    }

    _db= await initDatabase();
    return _db;
  }

  initDatabase() async{
    io.Directory documentDirectory= await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path, 'cart.db');
    var db= await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate (Database db , int version )async{
    await db.execute(
        'CREATE TABLE cart ('
            'name TEXT PRIMARY KEY , '
            'description TEXT,'
            'price TEXT, '
            'imageUrl TEXT)'
    );
  }

  Future<MenuItem> insert(MenuItem cart) async{
    var dbClient= await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<MenuItem>> getCartList() async{
    var dbClient= await db;
    final List<Map<String, Object?>> queryResult= await dbClient!.query('cart');
    return queryResult.map((e) => MenuItem.fromMap(e)).toList();
  }

  Future<int> deleteFromCart(String name) async{
    var dbClient= await db;
    return await dbClient!.delete(
        'cart',
        where: 'name = ?',
        whereArgs: [name]
    );
  }
}