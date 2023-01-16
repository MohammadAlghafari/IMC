import 'package:drift/drift.dart';

class AnalyticsTimeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userRoleIdLocalDB => integer()();
  TextColumn get month => text().nullable()();
  TextColumn get year => text().nullable()();
  IntColumn get hoursForStatus2 => integer().nullable()();
  IntColumn get hoursForStatus3 => integer().nullable()();
  IntColumn get hoursForStatus4 => integer().nullable()();
}