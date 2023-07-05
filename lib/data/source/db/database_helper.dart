import 'package:mkantin/data/models/food_entity.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();

    return _database;
  }

  static const String _tblFood = 'food';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/mkantin.db';

    final db =
        await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblFood (
          id INTEGER PRIMARY KEY,
          name TEXT,
          price INTEGER,
          image TEXT,
          category TEXT,
          total INTEGER
      );
    ''');
  }

  Future<int> insertFoodOrder(FoodEntity food) async {
    final db = await database;
    return await db!.insert(_tblFood, food.toJson());
  }

  Future<List<Map<String, dynamic>>> fetchFoodListOrder() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db!.query(_tblFood);
    return result;
  }
}
