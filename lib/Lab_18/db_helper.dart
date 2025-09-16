import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Lab_18/model/student.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create students table
        await db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            enrollment TEXT,
            semester TEXT,
            branch TEXT,
            mobile TEXT
          )
        ''');

        // Create users table
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');
        Future<int> updateStudent(Student student) async {
          final db = await database;
          return await db.update(
            'students',
            student.toMap(),
            where: 'id = ?',
            whereArgs: [student.id],
          );
        }


        // Insert default admin user
        await db.insert('users', {
          'username': 'admin',
          'password': 'admin123'
        });
      },
    );
  }

  // Insert default user if none exists
  Future<void> insertDefaultUser() async {
    final dbClient = await database;
    List<Map<String, dynamic>> users = await dbClient.query('users');
    if (users.isEmpty) {
      await dbClient.insert('users', {
        'username': 'admin',
        'password': 'admin123'
      });
    }
  }

  // Verify login credentials
  Future<bool> verifyUser(String username, String password) async {
    final dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  // Student CRUD
  Future<int> insertStudent(Student student) async {
    final db = await database;
    return await db.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final result = await db.query('students');
    return result.map((map) => Student.fromMap(map)).toList();
  }

  Future<int> updateStudent(Student student) async {
    final db = await database;
    return await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
