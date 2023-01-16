import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:imc/Analytics_screen/data/local_database/analytics_time_table.dart';
import 'package:imc/Analytics_screen/data/local_database/analytics_week_table.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_table.dart';
import 'package:imc/InterventionDetails/data/local_database/rc_local_database/rc_intervention_details_table.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'intervention_details_drift_helper.g.dart';

//* the LazyDatabase util lets us find the right location for the file async.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [InterventionDetailsTable, RCInterventionDetailsTable, AnalyticsTimeTable, AnalyticsWeekTable])
class InterventionDetailsDatabase extends _$InterventionDetailsDatabase {
  InterventionDetailsDatabase._privateConstructor() : super(_openConnection());

  static final InterventionDetailsDatabase _instance = InterventionDetailsDatabase._privateConstructor();

  factory InterventionDetailsDatabase() {
    return _instance;
  }
  @override
  int get schemaVersion => 2;

  ///=========================================== Normal Intervention Helper Functions ===============================================================================================
  ///[getInterventionDetailsFromDb] to get the intervention details from db as a future
  Future<List<InterventionDetailsTableData>> getInterventionDetailsFromDb() => select(interventionDetailsTable).get();

  ///[watchInterventionDetailsFromDb] to get the intervention details from db as a stream
  Stream<List<InterventionDetailsTableData>> watchInterventionDetailsFromDb() => select(interventionDetailsTable).watch();

  ///[getInterventionDetailsByIdFromDb] to get the intervention details of provided id
  Future<InterventionDetailsTableData?> getInterventionDetailsByIdFromDb(int idVal) {
    return (select(interventionDetailsTable)..where((tbl) => tbl.id.equals(idVal))).getSingleOrNull();
  }

  ///[insertIntervention] to store intervention details by passing 'InterventionDetailsTableData'
  Future<int> insertIntervention(InterventionDetailsTableData intervention) {
    return into(interventionDetailsTable).insert(intervention);
  }

  ///[insertInterventionIntoLocalDb] to store intervention details by passing 'InterventionDetailsModel'
  Future<int> insertInterventionIntoLocalDb(InterventionDetailsModel intervention) {
    //* converting List of data into string and saving it into a variable
    String? photoOfIndexImageString;
    String? enterAdditionallyMaterialString;
    String? photosOfNewMeterInstalledString;

    //* converting List of data(if only the data is not null, then encode) into string and saving it into a variable
    if (intervention.photoOfIndexImage != null && intervention.photoOfIndexImage!.isNotEmpty) {
      photoOfIndexImageString = jsonEncode(intervention.photoOfIndexImage);
    }
    if (intervention.enterAdditionallyMaterial != null && intervention.enterAdditionallyMaterial!.isNotEmpty) {
      enterAdditionallyMaterialString = jsonEncode(intervention.enterAdditionallyMaterial);
    }
    if (intervention.photosOfNewMeterInstalled != null && intervention.photosOfNewMeterInstalled!.isNotEmpty) {
      photosOfNewMeterInstalledString = jsonEncode(intervention.photosOfNewMeterInstalled);
    }

    //* converting the intervention details model into json
    var interventionJsonObject = intervention.toJson();

    //* replacing the value of key from the json
    interventionJsonObject['photoOfIndexImage'] = photoOfIndexImageString;
    interventionJsonObject['enterAdditionallyMaterial'] = enterAdditionallyMaterialString;
    interventionJsonObject['photosOfNewMeterInstalled'] = photosOfNewMeterInstalledString;
    interventionJsonObject['enterAdditionallyMaterial'] = enterAdditionallyMaterialString;
    interventionJsonObject['photosOfNewMeterInstalled'] = photosOfNewMeterInstalledString;

    //* converting the json we occupied from prev line into the TableData model
    var interventionDetailsTableData = InterventionDetailsTableData.fromJson(interventionJsonObject);

    return into(interventionDetailsTable).insertOnConflictUpdate(interventionDetailsTableData);
  }

  ///[insertInterventionIntoLocalDb] to delete the passed 'intervention'
  Future deleteInterventionDetails(InterventionDetailsTableData intervention) => delete(interventionDetailsTable).delete(intervention);

  Future deleteFromLocalDB(int interventionID) {
    // delete the intervention by id
    return (delete(interventionDetailsTable)..where((intervention) => intervention.id.equals(interventionID))).go();
  }

  ///=================================================================== RC Intervention Helper Functions =============================================================================

  ///[getRCInterventionDetailsFromDb] to get the rc intervention details from db as a future
  Future<List<RCInterventionDetailsTableData>> getRCInterventionDetailsFromDb() => select(rCInterventionDetailsTable).get();

  ///[getRCInterventionDetailsByIdFromDb] to get the rc intervention details of provided id
  Future<RCInterventionDetailsTableData?> getRCInterventionDetailsByIdFromDb(int idVal) {
    return (select(rCInterventionDetailsTable)..where((tbl) => tbl.id.equals(idVal))).getSingleOrNull();
  }

  ///[insertRCInterventionIntoLocalDb] to store intervention details by passing 'RCInterventionDetailsModel'
  Future<int> insertRCInterventionIntoLocalDb(RCInterventionDetailsModel rcIntervention) {
    String? photosOfActionImageString;

    //* converting List of data(if only the data is not null, then encode) into string and saving it into a variable
    if (rcIntervention.photosOfAction != null && rcIntervention.photosOfAction!.isNotEmpty) {
      photosOfActionImageString = jsonEncode(rcIntervention.photosOfAction);
    }

    //* converting the intervention details model into json
    var rcInterventionJsonObject = rcIntervention.toJson();

    //* replacing the value of key from the json
    rcInterventionJsonObject['photosOfAction'] = photosOfActionImageString;
    //* converting the json we occupied from prev line into the TableData model
    var rcInterventionDetailsTableData = RCInterventionDetailsTableData.fromJson(rcInterventionJsonObject);

    return into(rCInterventionDetailsTable).insertOnConflictUpdate(rcInterventionDetailsTableData);
  }

  ///[deleteRCInterventionDetails] to delete the rc intervention details
  Future deleteRCInterventionDetails(int rcInterventionId) {
    return (delete(rCInterventionDetailsTable)..where((rcIntervention) => rcIntervention.id.equals(rcInterventionId))).go();
  }

  ///========================================================= Analytics Week Helper Functions ========================================================================================
  ///[getAllAnalyticsWeekDataFromDb] to get all analytics week data
  Future<List<AnalyticsWeekTableData>> getAllAnalyticsWeekDataFromDb() => select(analyticsWeekTable).get();

  ///[insertWeekDataIntoLocalDB] to insert analytics week data into DB
  Future insertWeekDataIntoLocalDB(AnalyticsWeekTableData analyticsWeekData) {
    return into(analyticsWeekTable).insertOnConflictUpdate(analyticsWeekData);
  }

  ///[getAnalyticsWeekDataWithDate] to get the analytics week data of provided month, year
  Future<AnalyticsWeekTableData?> getAnalyticsWeekDataWithDate({required String year, required String month, required int userRoleId}) {
    return (select(analyticsWeekTable)..where((tbl) => tbl.month.equals(month) & tbl.year.equals(year) & tbl.userRoleIdLocalDB.equals(userRoleId)))
        .getSingleOrNull();
  }

  ///[deleteAnalyticsWeekData] to delete the analytics week data from db
  Future deleteAnalyticsWeekData({required int id}) {
    return (delete(analyticsWeekTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  ///========================================================= Analytics Time Helper Functions ========================================================================================
  ///[getAllAnalyticsTimeDataFromDb] to get all analytics time data
  Future<List<AnalyticsTimeTableData>> getAllAnalyticsTimeDataFromDb() => select(analyticsTimeTable).get();

  ///[insertTimeDataIntoLocalDB] to insert analytics time data into DB
  Future insertTimeDataIntoLocalDB(AnalyticsTimeTableData analyticsTimeData) {
    return into(analyticsTimeTable).insertOnConflictUpdate(analyticsTimeData);
  }

  ///[getAnalyticsTimeDataWithDate] to get the analytics time data of provided month, year
  Future<AnalyticsTimeTableData?> getAnalyticsTimeDataWithDate({required String year, required String month, required int userRoleId}) {
    return (select(analyticsTimeTable)..where((tbl) => tbl.month.equals(month) & tbl.year.equals(year) & tbl.userRoleIdLocalDB.equals(userRoleId))).getSingleOrNull();
  }

  ///[deleteAnalyticsTimeData] to delete the analytics time data from db
  Future deleteAnalyticsTimeData({required int id}) {
    return (delete(analyticsTimeTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  ///[deleteEverything]  function clears all the databases
  Future<void> deleteEverything() {
    return transaction(() async {
      // you only need this if you've manually enabled foreign keys
      // await customStatement('PRAGMA foreign_keys = OFF');
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}