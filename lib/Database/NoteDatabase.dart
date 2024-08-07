import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDatabase {
  Database? _privateDB;

  final String noteTable = "Note_Table";
  final String noteId = "Note_ID";
  final String noteTitle = "Note_Title";
  final String noteContent = "Note_Content";

  Future<Database?> get _db async {
    _privateDB ??= await intialDB();
    return _privateDB;
  }

  Future<Database> intialDB() async {
    String path = join(await getDatabasesPath(), 'privateDB.db');
    Database db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $noteTable (
        $noteId INTEGER PRIMARY KEY AUTOINCREMENT,
        $noteTitle TEXT,
        $noteContent TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $noteTable");
    await _onCreate(db, newVersion);
  }

  Future<List<Map<String, dynamic>>> readNotes() async {
    Database? tempDb = await _db;
    List<Map<String, dynamic>> result = await tempDb!.query(noteTable);
    return result;
  }


  Future<void> insertNote(String note_title, String note_content) async {
    Database? tempDB = await _db;
    int response = await tempDB!.rawInsert(
      "INSERT INTO $noteTable($noteTitle, $noteContent) VALUES (?, ?)",
      [note_title, note_content],
    );
  }

  Future<void> updateNote(int id, String note_content) async {
    Database? tempDB = await _db;
    int response = await tempDB!.update(
      noteTable,
      {noteContent: note_content},
      where: '$noteId = ?',
      whereArgs: [id],
    );
  }

   Future<void> deleteData(int id) async {
    Database? tempDb = await _db;
    int response = await tempDb!.delete(
      noteTable,
      where: '$noteId = ?',
      whereArgs: [id],
    );
  }

}
