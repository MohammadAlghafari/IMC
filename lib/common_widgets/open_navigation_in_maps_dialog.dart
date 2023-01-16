import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenNavigationInMapsDialog extends StatelessWidget {
  final double latitude;
  final double longitude;
  const OpenNavigationInMapsDialog({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  ///Function to open the client address (with passed lat, long, location name) according to installed map type on device
  void mapLauncher({required double latitude, required double longitude, required MapType mapType}) async {
    try {
      if (mapType == MapType.waze && (await MapLauncher.isMapAvailable(MapType.waze) as bool)) {
        await MapLauncher.showDirections(
          mapType: MapType.waze,
          destination: Coords(latitude, longitude),
          destinationTitle: "Client Address",
        );
      } else if (mapType == MapType.apple && await MapLauncher.isMapAvailable(MapType.apple) as bool) {
        await MapLauncher.showDirections(
          mapType: MapType.apple,
          destination: Coords(latitude, longitude),
          destinationTitle: "Client Address",
        );
      } else if (mapType == MapType.google && await MapLauncher.isMapAvailable(MapType.google) as bool) {
        await MapLauncher.showDirections(
          mapType: MapType.google,
          destination: Coords(latitude, longitude),
          destinationTitle: "Client Address",
        );
      } else {
        String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
        if (!await launchUrl(Uri.parse(googleUrl))) throw 'Could not launch $googleUrl';
      }
    } catch (e, stacktrace) {
      log("opening map error : $e");
      log("opening map stacktrace : $stacktrace");
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Dialog(
      child: Container(
        color: AppColor.kPrimaryColor.withOpacity(0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                "${appLocalizations.translate("open_in")} Waze",
              ),
              onTap: () {
                mapLauncher(latitude: latitude, longitude: longitude, mapType: MapType.waze);
                Navigator.pop(context); // close the dialog
              },
            ),
            ListTile(
              title: Text("${appLocalizations.translate("open_in")} Google Maps"),
              onTap: () {
                mapLauncher(latitude: latitude, longitude: longitude, mapType: MapType.google);
                Navigator.pop(context); // close the dialog
              },
            ),
            if (Platform.isIOS)
              ListTile(
                  title: Text("${appLocalizations.translate("open_in")} Apple Maps"),
                  onTap: () {
                    mapLauncher(latitude: latitude, longitude: longitude, mapType: MapType.apple);
                    Navigator.pop(context); // close the dialog
                  }),
          ],
        ),
      ),
    );
  }
}