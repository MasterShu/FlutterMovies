import 'package:flutter_movies/demo/db/db.dart';
import 'package:sqflite/sqflite.dart';

class Todo {
  final table = 'todos';
  int id;
  final String title;
  String createdAt;
  String deletedAt;
  static Database _db;

  Todo({this.id, this.title, this.createdAt, this.deletedAt});

  Future<int> add({todo}) async {
    await _initDB();
    if(null != todo) {
      return _db.insert(table, todo);
    }
    createdAt = DateTime.now().toString();
    return _db.insert(table, toMap());
  }

  Future<int> update({todo}) async {
    await _initDB();
    if(null != todo) {
      return _db.update(table, todo, where: 'id=?', whereArgs: [todo.id]);
    }
    return _db.update(table, toMap(), where: 'id=?', whereArgs: [id]);
  }

  Future<int> delete({deleteId}) async {
    if(null != deleteId) {
      var todo = {
        'id': deleteId,
        'deleted_at': DateTime.now().toString()
      };
      return await update(todo: todo);
    }
    deletedAt = DateTime.now().toString();
    return await update();
  }

  Future<List<Todo>> getAll() async {
    await _initDB();
    final List<Map<String, dynamic>> maps = await _db.query(table);
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        createdAt: maps[i]['created_at'],
        deletedAt: maps[i]['deleted_at']
      );
    });
  }

  Future<void> _initDB () async {
    _db = await DB().initDatabase();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'created_at': createdAt,
      'deleted_at': deletedAt
    };
  }
}
