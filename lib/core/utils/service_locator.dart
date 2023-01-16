import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';


final getIt = GetIt.instance;

/*
 This function will initialise all the below Classes
 and creates a singleton so we don't have to create new instances
 again and again.
 */

Future<void> setupLocator() async {
  getIt.allowReassignment = true;

  //setting up hive
  String hiveBox = "HiveKeyBox";
  hive.Box box = await hive.Hive.openBox(hiveBox);
  getIt.registerLazySingleton<hive.Box>(() => box);

  // Setting up get it instance for DIO
  Dio _dio = Dio();

  getIt.registerLazySingleton<Dio>(() => _dio);


  // setting up instance for local db
  getIt.registerLazySingleton<InterventionDetailsDatabase>(
          () => InterventionDetailsDatabase());

  // setting up instance for local db for rc intervention details
  // getIt.registerLazySingleton<RCInterventionDetailsDatabase>(
  //         () => RCInterventionDetailsDatabase());


}


