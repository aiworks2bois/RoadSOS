import 'package:drift/drift.dart';
import 'database_connection.dart' as impl;

part 'database.g.dart';

@DataClassName('IncidentCache')
class IncidentCaches extends Table {
  TextColumn get id => text()();
  TextColumn get payloadJson => text()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [IncidentCaches])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.openConnection());

  @override
  int get schemaVersion => 1;
}
