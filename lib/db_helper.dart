import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/pokemon.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  static Database? _database;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'pokemon.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pokemons (
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        type TEXT
      )
    ''');
  }

  Future<void> insertPokemon(Pokemon pokemon) async {
    final db = await database;
    await db.insert('pokemons', pokemon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Pokemon>> fetchPokemons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pokemons');
    return List.generate(maps.length, (i) {
      return Pokemon.fromMap(maps[i]);
    });
  }
}
