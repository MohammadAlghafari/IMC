import 'package:drift/drift.dart';

class AnalyticsWeekTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userRoleIdLocalDB => integer()();
  TextColumn get month => text().nullable()();
  TextColumn get year => text().nullable()();
  IntColumn get week1TotalForStatus2 => integer().nullable()();
  IntColumn get week1TotalForStatus3 => integer().nullable()();
  IntColumn get week1TotalForStatus4 => integer().nullable()();
  IntColumn get week2TotalForStatus2 => integer().nullable()();
  IntColumn get week2TotalForStatus3 => integer().nullable()();
  IntColumn get week2TotalForStatus4 => integer().nullable()();
  IntColumn get week3TotalForStatus2 => integer().nullable()();
  IntColumn get week3TotalForStatus3 => integer().nullable()();
  IntColumn get week3TotalForStatus4 => integer().nullable()();
  IntColumn get week4TotalForStatus2 => integer().nullable()();
  IntColumn get week4TotalForStatus3 => integer().nullable()();
  IntColumn get week4TotalForStatus4 => integer().nullable()();

}