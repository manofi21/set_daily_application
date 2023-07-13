part of 'setup_db.dart';

Future<void> initTables({
  required Database db,
  required int version,
}) async {
  await db.transaction(
    (txn) async {

    },
  );
}
