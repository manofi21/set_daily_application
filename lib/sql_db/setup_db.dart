import 'package:sqflite/sqflite.dart';

part 'init_table.dart';
part 'update_table.dart';


const int sqfLiteDatabaseVersion = 1;
const String sqfLiteDatabase = "database_hobby_activity_trakig.db";

Future<Database> getAndSetupDB() async {
    final db = await openDatabase(
    sqfLiteDatabase,
    version: sqfLiteDatabaseVersion,
    onCreate: (db, version) async {
      await initTables(
        db: db,
        version: version,
      );
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      await updateTables(
        db,
        oldVersion,
        newVersion,
      );
    },
  );
  return db;
}