// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:imc/common_widgets/custom_text.dart';
// import 'package:imc/core/constant/app_color.dart';
// import 'package:imc/core/utils/app_localizations.dart';
// import 'package:imc/core/utils/permission_utils.dart';
// // import 'package:map/map.dart';
// // import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:shimmer/shimmer.dart';
// // import 'package:latlng/latlng.dart';
//
// class GetTechnicianLocationMapScreen extends StatefulWidget {
//   static const String routeName = "/GetTechnicianLocationMapScreen";
//   const GetTechnicianLocationMapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GetTechnicianLocationMapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<GetTechnicianLocationMapScreen> {
//   //
//   bool _isFetchingLocation = true;
//   bool _isFetchingGeoCoding = true;
//
//   bool _isMapsLoadingCompleted = false;
//
//   //variable to store latitude, longitude values from the users device
//   double? _latitudeGotFromDevice;
//   double? _longitudeGotFromDevice;
//
//   //var to store all client location's markers
//   // Set<Marker> _setOfMarkers = Set();
//
//   //var to store place marks details
//   Placemark? _placeMarks;
//
//   // This will help in navigating back from maps
//   bool _isLoading = false;
//
//   /// [getLocation]will get the location from the user's device
//   void getLocation() {
//     //checking location's permission from the user
//     PermissionHelperFunctions.enableLocation(context, () async {
//       //getting user's current location
//       Position position = await Geolocator.getCurrentPosition();
//       _latitudeGotFromDevice = position.latitude;
//       _longitudeGotFromDevice = position.longitude;
//
//       //adding the user's location details as markers
//       // _setOfMarkers.add(Marker(
//       // markerId: MarkerId("$_latitudeGotFromDevice$_longitudeGotFromDevice"),
//       //     position: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!)));
//
//       //saving the placemarks details from the user's obtained current latitude, longitude
//       _placeMarks = (await placemarkFromCoordinates(_latitudeGotFromDevice!, _longitudeGotFromDevice!)).first;
//       //
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         // _cameraPosition = CameraPosition(
//         //   target: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
//         //   zoom: 16,
//         // );
//
//         controller = MapController(
//           location: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
//           zoom: 16,
//         );
//
//         setState(() {
//           _isFetchingLocation = false;
//           _isFetchingGeoCoding = false;
//         });
//
//         // final GoogleMapController controller = await _controller.future;
//         // controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
//       });
//     });
//   }

//   //controller that will  be used in google map
//   Completer<GoogleMapController> _controller = Completer();
//
//   //The position of the map "camera" for viewing of map
//   // static CameraPosition? _cameraPosition;
//
//   //var for map box controller
//   // late MapboxMapController controller;
//
//   // late MapController controller;
//
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Future.delayed(Duration(seconds: 1), (){
//   //     getLocation();
//   //   });
//   // }
//
//   // this function will initilize the map box controller and will fetch the location
//   // _onMapCreated(MapboxMapController controller) {
//   //   this.controller = controller;
//   //   // Future.delayed(Duration(seconds: 1), () {
//   //   //   getLocation();
//   //   // });
//   //   // setState(() {
//   //   //   _isMapsLoadingCompleted = true;
//   //   // });
//   // }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final appLocalizatons = AppLocalizations.of(context);
//     return Scaffold(
//         // body: Stack(
//         //   children: [
//         //     // if (!_isFetchingLocation && _latitudeGotFromDevice != null && _longitudeGotFromDevice != null)
//         //
//         //
//         //
//         //
//         //
//         //
//         //     if (_isFetchingLocation && _latitudeGotFromDevice == null && _longitudeGotFromDevice == null)
//         //       Center(
//         //         child: Column(
//         //           mainAxisAlignment: MainAxisAlignment.center,
//         //           children: [
//         //             CircularProgressIndicator(
//         //               color: Colors.black,
//         //             ),
//         //             SizedBox(
//         //               height: 0.02.sh,
//         //             ),
//         //             AppBoldText(
//         //               appLocalizatons.translate("fetching_location"),
//         //             )
//         //           ],
//         //         ),
//         //       ),
//         //
//         //     if (!_isFetchingLocation && _latitudeGotFromDevice != null && _longitudeGotFromDevice != null)
//         //       Transform.translate(
//         //           offset: Offset(0, -20),
//         //         child:  Center(
//         //           child: Icon(Icons.location_on, color: Colors.red, size: 50,),
//         //         ),
//         //       ),
//         //
//         //
//         //
//         //       Align(
//         //       alignment: Alignment.bottomCenter,
//         //       child: Container(
//         //         height: 0.25.sh,
//         //         width: 1.sw,
//         //         decoration: BoxDecoration(
//         //             color: AppColor.kWhiteColor,
//         //             borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
//         //             boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)]),
//         //         child: Padding(
//         //           padding: const EdgeInsets.symmetric(horizontal: 30),
//         //           child: Column(
//         //             mainAxisAlignment: MainAxisAlignment.center,
//         //             children: [
//         //               SizedBox(height: 10),
//         //               Row(
//         //                 children: [
//         //                   Container(
//         //                     height: .09.sh,
//         //                     width: .09.sw,
//         //                     decoration: BoxDecoration(
//         //                       shape: BoxShape.circle,
//         //                       color: AppColor.kPrimaryColor.withOpacity(.3),
//         //                     ),
//         //                     child: Icon(Icons.location_on, color: AppColor.kPrimaryColor),
//         //                   ),
//         //                   SizedBox(width: 15),
//         //                   Expanded(
//         //                     child: Column(
//         //                       crossAxisAlignment: CrossAxisAlignment.start,
//         //                       children: [
//         //                         if (_placeMarks == null || _isFetchingGeoCoding == true)
//         //                           Shimmer.fromColors(
//         //                               baseColor: Colors.grey,
//         //                               highlightColor: Colors.grey.shade300,
//         //                               child: Container(
//         //                                 width: 1.sw,
//         //                                 height: 14,
//         //                                 color: Colors.grey,
//         //                               )),
//         //                         if (_placeMarks == null || _isFetchingGeoCoding == true)
//         //                           SizedBox(
//         //                             height: 0.01.sh,
//         //                           ),
//         //                         if (_placeMarks == null || _isFetchingGeoCoding == true)
//         //                           Shimmer.fromColors(
//         //                               baseColor: Colors.grey,
//         //                               highlightColor: Colors.grey.shade300,
//         //                               child: Container(
//         //                                 width: 0.6.sw,
//         //                                 height: 14,
//         //                                 color: Colors.grey,
//         //                               )),
//         //                         if (_placeMarks != null && _isFetchingGeoCoding == false)
//         //                           AppRegularText(
//         //                             "${_placeMarks?.street}, ${_placeMarks?.subLocality}, ${_placeMarks?.thoroughfare}\n${_placeMarks?.subAdministrativeArea}, ${_placeMarks?.administrativeArea}, ${_placeMarks?.country}",
//         //                             fontSize: 14,
//         //                             color: Colors.black,
//         //                           ),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //               SizedBox(
//         //                 height: 0.02.sh,
//         //               ),
//         //               GestureDetector(
//         //                   onTap: () {
//         //                     // if (_isMapsLoadingCompleted) {
//         //                     //   if (_latitudeGotFromDevice != null && _longitudeGotFromDevice != null) {
//         //                     //     setState(() {
//         //                     //       _isLoading = true;
//         //                     //     });
//         //                     //     double lat = _latitudeGotFromDevice ?? 0.0;
//         //                     //     double lon = _longitudeGotFromDevice ?? 0.0;
//         //                     //     Future.delayed(Duration(milliseconds: 0), () {
//         //                     //       try {
//         //                     //         Navigator.pop(context, LatLng(lat, lon));
//         //                     //       } catch (e, stack) {
//         //                     //         print("MAPS_______$e");
//         //                     //         print("MAPS_______$stack");
//         //                     //       }
//         //                     //     });
//         //                     //   }
//         //                     // }
//         //                     // Navigator.pop(
//         //                     //     context,
//         //                     //     LatLng(0.0, 0.0)
//         //                     // );
//         //                   },
//         //                   child: Container(
//         //                       width: 1.sw,
//         //                       height: 40,
//         //                       decoration: BoxDecoration(color: AppColor.kPrimaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(20)),
//         //                       child: Center(
//         //                           child: _isLoading
//         //                               ? SizedBox(
//         //                               height: 25,
//         //                               width: 25,
//         //                               child: CircularProgressIndicator(
//         //                                 strokeWidth: 2,
//         //                               ))
//         //                               : AppBoldText(appLocalizatons.translate("confirm_location"), color: AppColor.kPrimaryColor))))
//         //             ],
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //     Positioned(
//         //       top: 30,
//         //       left: 20,
//         //       child: GestureDetector(
//         //         onTap: () {
//         //           Navigator.pop(context);
//         //         },
//         //         child: Container(
//         //           height: 0.1.sh,
//         //           width: 0.1.sw,
//         //           decoration:
//         //           BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhiteColor, boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8.0)]),
//         //           child: Icon(Icons.arrow_back, color: AppColor.kPrimaryColor),
//         //         ),
//         //       ),
//         //     ),
//         //     Positioned(
//         //       bottom: 0.22.sh,
//         //       right: 30,
//         //       child: Container(
//         //         decoration: BoxDecoration(color: AppColor.kPrimaryColor, shape: BoxShape.circle),
//         //         child: IconButton(
//         //           onPressed: () async {
//         //             // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         //             //   target: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
//         //             //   zoom: 16,
//         //             // )));
//         //           },
//         //           icon: Icon(Icons.my_location, color: AppColor.kWhiteColor),
//         //         ),
//         //       ),
//         //     ),
//         //   ],
//         // )
//       body:  GoogleMap(
//           minMaxZoomPreference: MinMaxZoomPreference(0, 16),
//           zoomGesturesEnabled: false,
//           myLocationButtonEnabled: true,
//           // initialCameraPosition: _cameraPosition!,
//           initialCameraPosition: CameraPosition(
//             target: LatLng(0.0, 0.0),
//             zoom: 16,
//           ),
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//             //   Future.delayed(Duration(seconds: 1), (){
//             //     getLocation();
//             //   });
//             //   setState(() {
//             //     _isMapsLoadingCompleted = true;
//             //   });
//             // },
//             // markers: _setOfMarkers,
//           }
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:latlong2/latlong.dart' as latLon;

class GetTechnicianLocationMapScreen extends StatefulWidget {
  static const String routeName = "/GetTechnicianLocationMapScreen";
  const GetTechnicianLocationMapScreen({Key? key}) : super(key: key);

  @override
  State<GetTechnicianLocationMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<GetTechnicianLocationMapScreen> {
  //
  bool _isFetchingLocation = true;
  bool _isFetchingGeoCoding = true;

  // bool _isMapsLoadingCompleted = false;

  //variable to store latitude, longitude values from the users device
  double? _latitudeGotFromDevice;
  double? _longitudeGotFromDevice;

  //var to store all client location's markers
  List<flutterMap.Marker> _listOfMarkers = [];

  //var to store place marks details
  Placemark? _placeMarks;

  // This will help in navigating back from maps
  bool _isLoading = false;

  /// [getLocation]will get the location from the user's device
  void getLocation() {
    //checking location's permission from the user
    PermissionHelperFunctions.enableLocation(context, () async {
      //getting user's current location
      Position position = await Geolocator.getCurrentPosition();
      _latitudeGotFromDevice = position.latitude;
      _longitudeGotFromDevice = position.longitude;

      //adding the user's location details as markers
      _listOfMarkers.add(
          flutterMap.Marker(
              point: latLon.LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
              builder: (_){
      return Icon(Icons.location_on, size: 50, color: Colors.red.shade700,);
      }
      ));

      //saving the place-marks details from the user's obtained current latitude, longitude
      _placeMarks = (await placemarkFromCoordinates(_latitudeGotFromDevice!, _longitudeGotFromDevice!)).first;

      Future.delayed(Duration(seconds: 1), (){
        setState(() {
          _isFetchingLocation = false;
          _isFetchingGeoCoding = false;
        });
      });

    });
  }


  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);
    return Scaffold(
        body: Stack(
          children: [
            if (!_isFetchingLocation && _latitudeGotFromDevice != null && _longitudeGotFromDevice != null)
              flutterMap.FlutterMap(
                options: flutterMap.MapOptions(
                  center: latLon.LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
                  zoom: 16,
                ),
                children: [
                  flutterMap.TileLayer(
                    urlTemplate: 'https://api.mapbox.com/styles/v1/itfaqsystems/clbaoqvi3006q15ohi0j94n8q/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXRmYXFzeXN0ZW1zIiwiYSI6ImNsYjJvMG55NjA2OW8zb3FlY2U1ZXJhY3QifQ.ZVvFVMtZ7SPW3NskDKrVuw',
                    additionalOptions: {
                      'accessToken': 'pk.eyJ1IjoiaXRmYXFzeXN0ZW1zIiwiYSI6ImNsYjJvMG55NjA2OW8zb3FlY2U1ZXJhY3QifQ.ZVvFVMtZ7SPW3NskDKrVuw',
                      'id': 'mapbox.mapbox-streets-v8'
                    },
                    maxZoom: 24.0,
                  ),
                  flutterMap.MarkerLayer(
                    markers: _listOfMarkers,
                  )
                ],
              ),

            if (_isFetchingLocation && _latitudeGotFromDevice == null && _longitudeGotFromDevice == null)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    AppBoldText(appLocalizatons.translate("fetching_location"))
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 0.25.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: AppColor.kWhiteColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: .09.sh,
                            width: .09.sw,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.kPrimaryColor.withOpacity(.3),
                            ),
                            child: Icon(Icons.location_on, color: AppColor.kPrimaryColor),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_placeMarks == null || _isFetchingGeoCoding == true)
                                  Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.grey.shade300,
                                      child: Container(
                                        width: 1.sw,
                                        height: 14,
                                        color: Colors.grey,
                                      )),
                                if (_placeMarks == null || _isFetchingGeoCoding == true)
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                if (_placeMarks == null || _isFetchingGeoCoding == true)
                                  Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.grey.shade300,
                                      child: Container(
                                        width: 0.6.sw,
                                        height: 14,
                                        color: Colors.grey,
                                      )),
                                if (_placeMarks != null && _isFetchingGeoCoding == false)
                                  AppRegularText(
                                    "${_placeMarks?.street}, ${_placeMarks?.subLocality}, ${_placeMarks?.thoroughfare}\n${_placeMarks?.subAdministrativeArea}, ${_placeMarks?.administrativeArea}, ${_placeMarks?.country}",
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      GestureDetector(
                          onTap: () {
                            if(_isFetchingLocation == false && _isFetchingGeoCoding ==false) {
                              if (_latitudeGotFromDevice != null &&
                                  _longitudeGotFromDevice != null) {
                                Navigator.pop(context, LatLng(
                                    _latitudeGotFromDevice!,
                                    _longitudeGotFromDevice!)
                                );
                              }
                            }
                          },
                          child: Container(
                              width: 1.sw,
                              height: 40,
                              decoration: BoxDecoration(color: AppColor.kPrimaryColor.withOpacity(.3), borderRadius: BorderRadius.circular(20)),
                              child: Center(child:
                              _isLoading ? SizedBox(height: 25,width: 25,child: CircularProgressIndicator(strokeWidth: 2,) ):
                              AppBoldText(appLocalizatons.translate("confirm_location"), color: AppColor.kPrimaryColor)

                              )))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 0.1.sh,
                  width: 0.1.sw,
                  decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhiteColor, boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8.0)]),
                  child: Icon(Icons.arrow_back, color: AppColor.kPrimaryColor),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0.22.sh,
            //   right: 30,
            //   child: Container(
            //     decoration: BoxDecoration(color: AppColor.kPrimaryColor, shape: BoxShape.circle),
            //     child: IconButton(
            //       onPressed: () async {
            //         // final GoogleMapController controller = await _controller.future;
            //         // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            //         //   target: LatLng(_latitudeGotFromDevice!, _longitudeGotFromDevice!),
            //         //   zoom: 16,
            //         // )));
            //       },
            //       icon: Icon(Icons.my_location, color: AppColor.kWhiteColor),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}