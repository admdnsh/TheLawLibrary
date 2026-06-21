import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LawDatabase {
  static final LawDatabase instance = LawDatabase._internal();
  static Database? _database;

  LawDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'law_library.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE laws ADD COLUMN Title_MS TEXT');
      await db.execute('ALTER TABLE laws ADD COLUMN Description_MS TEXT');
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE laws (
        id INTEGER PRIMARY KEY AUTOINCREMENT,

        Chapter TEXT NOT NULL,
        Category TEXT NOT NULL,
        Title TEXT NOT NULL,
        Title_MS TEXT,
        Description TEXT NOT NULL,
        Description_MS TEXT,

        Compound_Fine TEXT,
        Second_Compound_Fine TEXT,
        Third_Compound_Fine TEXT,
        Fourth_Compound_Fine TEXT,
        Fifth_Compound_Fine TEXT,

        isFavorite INTEGER DEFAULT 0
      )
    ''');
  }
}
