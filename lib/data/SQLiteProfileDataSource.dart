import 'package:flutter/cupertino.dart';
import 'package:persistence_example/data/ProfileDataSource.dart';
import 'package:persistence_example/model/Profile.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteProfileDataSource implements ProfileDataSource {
  static const String _PROFILE_SQLITE_DATABASE = "profile_db";
  static const String _PROFILE_SQLITE_TABLE = "profile";

  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
        await getDatabasesPath() + "/" + _PROFILE_SQLITE_DATABASE,
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE PROFILE(id INTEGER PRIMARY KEY, name TEXT, address TEXT)"
          );
        },
        version: 1
    );
  }

  @override
  Future<bool> deleteProfile() async {
    final db = await database;
    return await db.delete(_PROFILE_SQLITE_TABLE) > 0;
  }

  @override
  Future<Profile?> getProfile() async {
    final db = await database;

    final List<Map<String, dynamic>> map =
      await db.query(_PROFILE_SQLITE_TABLE);

    if (map.isEmpty) return null;

    return Profile(
        id: map[0]['id'],
        name: map[0]['name'],
        address: map[0]['address']
    );
  }

  @override
  Future<bool> setProfile(Profile profile) async {
    final db = await database;

    return await db.insert(
        _PROFILE_SQLITE_TABLE,
        profile.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    ) >  0;
  }
}
