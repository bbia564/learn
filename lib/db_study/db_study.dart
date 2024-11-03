import 'dart:convert';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_records/db_study/study_entity.dart';

class DBStudy extends GetxService {
  late Database dbBase;

  Future<DBStudy> init() async {
    await createStudyDB();
    return this;
  }

  createStudyDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'study.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createStudyTable(db);
        });
  }

  createStudyTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS study (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT, list TEXT)');
  }

  insertData(TypeEntity entity) async {
    final id = await dbBase.insert('study', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateData(TypeEntity entity) async {
    await dbBase.update(
        'study',
        {
          'title': entity.title,
          'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('study');
  }

  Future<List<TypeEntity>> getAllData() async {
    var result = await dbBase.query('study', orderBy: 'createTime DESC');
    return result.map((e) => TypeEntity.fromJson(e)).toList();
  }
}
