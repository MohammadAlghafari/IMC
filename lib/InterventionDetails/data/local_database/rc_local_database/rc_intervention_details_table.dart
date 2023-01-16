import 'package:drift/drift.dart';

class RCInterventionDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get startTimeOfIntervention => text().nullable()();
  TextColumn get endTimeOfIntervention => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  BoolColumn get confirmMeterReprogramming => boolean().nullable()();
  TextColumn get meterReprogrammingImage1 => text().nullable()();
  TextColumn get meterReprogrammingImage2 => text().nullable()();
  TextColumn get additionalInfoOfMeterReprogramming => text().nullable()();
  BoolColumn get confirmEnslavementTest => boolean().nullable()();
  TextColumn get meterEnslavementTestImage1 => text().nullable()();
  TextColumn get meterEnslavementTestImage2 => text().nullable()();
  TextColumn get additionalInfoOfEnslavementTest => text().nullable()();
  TextColumn get specifyYourAction => text().nullable()();
  TextColumn get photosOfAction => text().nullable()();
  TextColumn get additionalInfoOfActions => text().nullable()();
  TextColumn get photoOfWiring => text().nullable()();
  TextColumn get photoOfNewPoseMeter => text().nullable()();
  BoolColumn get isGripCase => boolean().nullable()();
  TextColumn get gripCaseReason => text().nullable()();
  TextColumn get noticeOfPassageImage1 => text().nullable()();
  TextColumn get noticeOfPassageImage2 => text().nullable()();
  TextColumn get displacementPhotoImage1 => text().nullable()();
  TextColumn get displacementPhotoImage2 => text().nullable()();
  TextColumn get gripCaseComment => text().nullable()();

}