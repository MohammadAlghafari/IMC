import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:imc/common_widgets/open_navigation_in_maps_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_day/presentation/cubit/team_leader_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/map_cubit/planning_day_map_cubit.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;

class PlanningDayMapWidget extends StatefulWidget {
  const PlanningDayMapWidget({Key? key}) : super(key: key);

  @override
  State<PlanningDayMapWidget> createState() => _PlanningDayMapWidgetState();
}

class _PlanningDayMapWidgetState extends State<PlanningDayMapWidget> with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _googleMapController = Completer();
  //controlling animations
  late AnimationController? _animationController;
  late Animation<Offset> _offset;

  //to store all the intervention's location
  Set<Marker> _setOfMarkers = {};

  //var to store the location of normal intervention
  Records? _selectedLocation;

  //var to store the location of team leader intervention
  teamLeaderInterventionModel.Records? _teamLeaderSelectedLocation;

  //value obtained from user's device
  double? _latitudeGotFromDevice;
  double? _longitudeGotFromDevice;

  //initial user's camera postion
  CameraPosition? _initCameraLocation;

  @override
  void initState() {
    super.initState();

    //initializing slide animation
    initAnimation();

    //getting user's current location
    getLocation();

  }

  ///[initAnimation] initilize the slide animation with it offset property
  void initAnimation() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.elasticIn,
    ));
  }

  ///[getLocation] getting the user's current location
  void getLocation() {
    PermissionHelperFunctions.enableLocation(context, () async {
      Position position = await Geolocator.getCurrentPosition();
      _latitudeGotFromDevice = position.latitude;
      _longitudeGotFromDevice = position.longitude;

      _initCameraLocation = CameraPosition(
        target: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
        zoom: 14.4746,
      );

      // initializing maps data from bloc
      initDataFromBloc();

    });
  }

  ///[initDataFromBloc] initialize data(list of intervention with their client's location) according the the [UserRoles] we get from local DB
  void initDataFromBloc() {
    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
      //accessing 'list of intervention on map' bloc
      final _planningMapWidget = BlocProvider.of<PlanningDayMapCubit>(context);
      //getting the interventions with the locations list to show on map
      _planningMapWidget.getListOfInterventionOnMap();
    } else if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
      //accessing 'team leader planning day' bloc
      final _teamLeaderPlannningDay = BlocProvider.of<TeamLeaderPlanningDayCubit>(context);
      //getting team leader today's intervention with their locations
      _teamLeaderPlannningDay.getTeamLeaderInterventionForToday([InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode]);
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID)
        ? BlocConsumer<PlanningDayMapCubit, PlanningDayMapState>(
      listener: (context, state) {
        if (state is PlanningDayMapLoaded) {
          List<Records?>? _listOfRecords = state.listOfRecords;
          _setOfMarkers = _listOfRecords!.map((intervention) {
            double latitude = double.tryParse(intervention?.client?.latitude.toString() ?? "0.0") ?? 0.0;
            double longitude = double.tryParse(intervention?.client?.longitude.toString() ?? "0.0") ?? 0.0;
            return Marker(
                markerId: MarkerId("${intervention!.id}"),
                position: LatLng(latitude, longitude),
                infoWindow: InfoWindow(title: "${intervention.client?.firstname}"),
                onTap: () async {
                  _changeLocationOnMap(intervention: intervention, latitude: latitude, longitude: longitude);
                });
          }).toSet();
        }
      },
      builder: (context, state) {
        if (state is PlanningDayMapLoaded) {
          List<Records?>? _listOfRecords = state.listOfRecords;
          return Stack(
            children: [
              if (_latitudeGotFromDevice != null && _longitudeGotFromDevice != null)
                GoogleMap(
                  mapToolbarEnabled: false,
                  initialCameraPosition: _initCameraLocation!,
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController.complete(controller);
                  },
                  markers: _setOfMarkers,
                ),
              if (_latitudeGotFromDevice == null || _longitudeGotFromDevice == null)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      AppBoldText(appLocalizations.translate("fetching_location"))
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _offset,
                  child: Container(
                    height: 150,
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        Records intervention = _listOfRecords![index]!;
                        double latitude = double.tryParse(intervention.client?.latitude.toString() ?? "0.0") ?? 0.0;
                        double longitude = double.tryParse(intervention.client?.longitude.toString() ?? "0.0") ?? 0.0;

                        _changeLocationOnMap(intervention: intervention, latitude: latitude, longitude: longitude);
                      },
                      children: [
                        ..._listOfRecords!
                            .map((e) => Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: AppColor.kPrimaryColor, borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppBoldText(
                                      "${e?.client?.firstname}",
                                      color: Colors.white,
                                    ),
                                    AppRegularText("${e?.scheduleStart.toString().substring(0, 10)}", color: Colors.white),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  double? latitude = double.tryParse(_selectedLocation?.client?.latitude.toString() ?? "0.0") ?? 0.0;
                                  double? longitude = double.tryParse(_selectedLocation?.client?.longitude.toString() ?? "0.0") ?? 0.0;
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return OpenNavigationInMapsDialog(latitude: latitude, longitude: longitude);
                                      });

                                },
                                child: AppRegularText(
                                  appLocalizations.translate("get_directions"),
                                  color: AppColor.kPrimaryColor,
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
                              )
                            ],
                          ),
                        ))
                            .toSet()
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is PlanningDayMapError) {
          return Center(
              child: Column(
                children: [
                  AppRegularText(appLocalizations.translate("there_is_some_error_displaying_intervention_map")),
                  CupertinoButton(
                    color: AppColor.kPrimaryColor,
                    child: Text(appLocalizations.translate("retry")),
                    onPressed: () {
                      final _planningMapWidget = BlocProvider.of<PlanningDayMapCubit>(context);
                      _planningMapWidget.getListOfInterventionOnMap();
                    },
                  )
                ],
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    )
        : BlocConsumer<TeamLeaderPlanningDayCubit, TeamLeaderPlanningDayState>(
      listener: (context, state) {
        if (state is TeamLeaderPlanningDayLoaded) {
          List<teamLeaderInterventionModel.Records?>? _listOfRecords = state.listOfRecords;
          _setOfMarkers = _listOfRecords!.map((intervention) {
            double latitude = double.tryParse(intervention?.client?.latitude.toString() ?? "0.0") ?? 0.0;
            double longitude = double.tryParse(intervention?.client?.toString() ?? "0.0") ?? 0.0;
            return Marker(
                markerId: MarkerId("${intervention!.id}"),
                position: LatLng(latitude, longitude),
                infoWindow: InfoWindow(title: "${intervention.client?.firstname}"),
                onTap: () async {
                  _changeLocationOnMap(teamLeaderIntervention: intervention, latitude: latitude, longitude: longitude);
                });
          }).toSet();
        }
      },
      builder: (context, state) {
        if (state is TeamLeaderPlanningDayLoaded) {
          List<teamLeaderInterventionModel.Records?>? _listOfRecords = state.listOfRecords;
          return Stack(
            children: [
              if (_latitudeGotFromDevice != null && _longitudeGotFromDevice != null)
                GoogleMap(
                  minMaxZoomPreference: MinMaxZoomPreference(0, 16),
                  mapToolbarEnabled: false,
                  initialCameraPosition: _initCameraLocation!,
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController.complete(controller);
                  },
                  markers: _setOfMarkers,
                ),
              if (_latitudeGotFromDevice == null && _longitudeGotFromDevice == null)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      AppBoldText(appLocalizations.translate("fetching_location"))
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _offset,
                  child: Container(
                    height: 150,
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        teamLeaderInterventionModel.Records intervention = _listOfRecords![index]!;
                        double latitude = double.tryParse(intervention.client?.latitude.toString() ?? "0.0") ?? 0.0;
                        double longitude = double.tryParse(intervention.client?.longitude.toString() ?? "0.0") ?? 0.0;

                        _changeLocationOnMap(teamLeaderIntervention: intervention, latitude: latitude, longitude: longitude);
                      },
                      children: [
                        ..._listOfRecords!
                            .map((e) => Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppBoldText(
                                      "${e?.client?.firstname} ",
                                      color: Colors.white,
                                    ),
                                    AppRegularText("${e?.scheduleStart.toString().substring(0, 10)}", color: Colors.white),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  double? latitude = double.tryParse(_selectedLocation?.client?.latitude.toString() ?? "0.0") ?? 0.0;
                                  double? longitude = double.tryParse(_selectedLocation?.client?.longitude.toString() ?? "0.0") ?? 0.0;
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return OpenNavigationInMapsDialog(latitude: latitude, longitude: longitude);
                                      });
                                },
                                child: AppRegularText(
                                  appLocalizations.translate("get_directions"),
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
                              )
                            ],
                          ),
                        ))
                            .toSet()
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is TeamLeaderPlanningDayError) {
          return Center(
              child: Column(
                children: [
                  AppRegularText(appLocalizations.translate("there_is_some_error_displaying_intervention_map")),
                  CupertinoButton(
                    color: AppColor.kPrimaryColor,
                    child: Text(appLocalizations.translate("retry")),
                    onPressed: () {
                      final _planningMapWidget = BlocProvider.of<TeamLeaderPlanningDayCubit>(context);
                      _planningMapWidget.getTeamLeaderInterventionForToday([InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode]);
                    },
                  )
                ],
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /// The function [_changeLocationOnMap] can change the location of marker on map
  void _changeLocationOnMap(
      {required double latitude,
        required double longitude,
        Records? intervention,
        teamLeaderInterventionModel.Records? teamLeaderIntervention}) async {
    final CameraPosition _newPosition = CameraPosition(target: LatLng(latitude, longitude), zoom: 30);

    setState(() {
      if (intervention != null) {
        _selectedLocation = intervention;
      } else if (teamLeaderIntervention != null) {
        _teamLeaderSelectedLocation = teamLeaderIntervention;
      }
    });

    _animationController!.forward();

    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_newPosition));
  }
}
