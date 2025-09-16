import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/student.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'students.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            course TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.insert('students', student.toMap());
  }

  static Future<List<Student>> getStudents() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('students');
    return maps.map((e) => Student.fromMap(e)).toList();
  }

  static Future<int> updateStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  static Future<int> deleteStudent(int id) async {
    final dbClient = await db;
    return await dbClient.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
