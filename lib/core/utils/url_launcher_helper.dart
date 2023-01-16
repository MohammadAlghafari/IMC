import 'dart:developer';

import 'package:imc/core/utils/app_function.dart';
import 'package:url_launcher/url_launcher.dart' as URL;

class UrlLauncher{
  static Future<void> launchUrl(String url) async {
    try {
      await URL.launchUrl(Uri.parse(url));
    }
    catch(e){
      log("$e");
      flutterToast("could not launch url");
    }
  }
}