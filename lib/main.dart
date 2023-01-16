import 'dart:io';

import 'package:calendar_view/calendar_view.dart';
import 'package:dio_log/dio_log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imc/Analytics_screen/data/api/analytics_api_handler.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_week_cubit/analytics_week_cubit.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_time_cubit/analytics_time_cubit.dart';
import 'package:imc/Auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:imc/Auth/data/api/auth_api_handler.dart';
import 'package:imc/InterventionDetails/data/api/customer_interventions_history_api_handler.dart';
import 'package:imc/InterventionDetails/data/api/intervention_details_api_handler.dart';
import 'package:imc/InterventionDetails/data/repositories/InterventionDetailsRepository.dart';
import 'package:imc/InterventionDetails/presentation/cubit/customer_interventions_history_cubit/customer_interventions_history_cubit_cubit.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/team_leader_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/technician_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/map_cubit/planning_day_map_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/team_leader_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/technician_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_week/presentation/cubit/team_leader_cubit/planning_week_cubit.dart';
import 'package:imc/Planning_week/presentation/cubit/technician_cubit/planning_week_cubit.dart';
import 'package:imc/Planning_week/data/model/event_model.dart';
import 'package:imc/TeamLeader/data/api/team_leader_api_handler.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_question_repository.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_question_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_upload_pdf_cubit/team_leader_questions_upload_pdf_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/intervention_count_cubit/intervention_count_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/ongoing_intervention_cubit/team_leader_ongoing_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/team_leader_team_members_cubit/team_leader_team_members_cubit.dart';
import 'package:imc/base_screen/presentation/manager/ticker.dart';
import 'package:imc/base_screen/presentation/manager/timer_bloc/timer_bloc.dart';
import 'package:imc/common_data_folder/intervention_data/api/intervention_api_handler.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/language.dart';
import 'package:imc/splash_screen.dart';

import 'InterventionDetails/presentation/cubit/tech_marque_cubit/tech_marque_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTEYuIa71uHvoOU61ZoVxjQOgej2dyroY",
            appId: "1:678668819264:ios:7cc35094d959a2baa3b8a5",
            messagingSenderId: "678668819264",
            projectId: "imc-app-345008"));
  } else {
    await Firebase.initializeApp();
  }

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // // Require Hybrid Composition mode on Android.
  // final GoogleMapsFlutterPlatform mapsImplementation =
  //     GoogleMapsFlutterPlatform.instance;
  // if (mapsImplementation is GoogleMapsFlutterAndroid) {
  //   mapsImplementation.useAndroidViewSurface = true;
  // }

  await Hive.initFlutter();

  await GetStorage.init();


  InterventionApiHandler _interventionAPIHandler = InterventionApiHandler();
  InterventionDetailsRepository _interventionDetailsApiHandler = InterventionDetailsApiHandler();
  AuthApiHandler _authApiHandler = AuthApiHandler();
  CustomerInterventionsHistoryApiHandler _customerInterventionsHistoryApiHandler = CustomerInterventionsHistoryApiHandler();
  AnalyticsApiHandler _analyticsApiHandler = AnalyticsApiHandler();
  TeamLeaderQuestionRepository _teamLeaderQuestionRepository = TeamLeaderQuestionRepository();

  TeamLeaderApiHandler _teamLeaderApiHandler = TeamLeaderApiHandler();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => PlanningMonthCubit(_interventionAPIHandler)),
    BlocProvider(create: (BuildContext context) => PlanningDayCubit(_interventionAPIHandler)),
    BlocProvider(create: (BuildContext context) => PlanningDayCompletedInterventionCubit(_interventionAPIHandler)),
    BlocProvider(create: (BuildContext context) => PlanningDayMapCubit(_interventionAPIHandler)),
    BlocProvider(create: (BuildContext context) => PlanningWeekCubit(_interventionAPIHandler)),
    BlocProvider(create: (BuildContext context) => CustomerInterventionsHistoryCubit(_customerInterventionsHistoryApiHandler)),
    BlocProvider(create: (BuildContext context) => InterventionDetailsCubit(_interventionDetailsApiHandler)),
    BlocProvider(create: (BuildContext context) => TimerBloc(ticker: Ticker())),
    BlocProvider(create: (BuildContext context) => TechMarqueCubit(_interventionDetailsApiHandler)),
    BlocProvider(create: (BuildContext context) => LoginCubit(_authApiHandler)),
    BlocProvider(create: (BuildContext context) => RCInterventionDetailsCubit(_interventionDetailsApiHandler)),
    BlocProvider(create: (BuildContext context) => AnalyticsWeekCubit(_analyticsApiHandler)),
    BlocProvider(create: (BuildContext context) => AnalyticsTimeCubit(_analyticsApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderQuestionCubit(_teamLeaderQuestionRepository)),
    BlocProvider(create: (BuildContext context) => InterventionCountCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderOngoingInterventionsCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderTeamMembersCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderQuestionsUploadPdfCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamMemberInterventionsCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamMemberTodoInterventionsCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderPlanningMonthCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderPlanningDayCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderPlanningDayCompletedInterventionCubit(_teamLeaderApiHandler)),
    BlocProvider(create: (BuildContext context) => TeamLeaderPlanningWeekCubit(_teamLeaderApiHandler)),
  ], child: MyApp()));
}



class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController<Event>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IMC',
            translations: Lang(context),
            // initialBinding: BaseBinding(),
            // useInheritedMediaQuery: false,
            // builder: DevicePreview.appBuilder,
            // locale: DevicePreview.locale(context),
            locale: Lang.locale,
            // fallbackLocale: Lang.fallbackLocale,
            // initialRoute: initialRoute,
            home: child,
            // getPages: routes,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('fr', 'FRA'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate],
            // This returns a locale that will be used by our app
            localeResolutionCallback: (locale, listOfSupportedLocales) {
              // check if locale is supported
              for (var supportedLocale in listOfSupportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              // if the locale of the device is not supported, use the first one
              // from the list (i.e. English)
              return listOfSupportedLocales.first;
            },
          );
        },
        child: SplashScreen(),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   showDebugBtn(context,btnColor: Colors.blue);
  // }
}

// TESTING JAYANT