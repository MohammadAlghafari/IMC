import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioConnectivityRequestRetrier{
  final Dio? dio;
  final Connectivity? connectivity;

  DioConnectivityRequestRetrier({
    @required this.dio,
    @required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async{
    StreamSubscription? streamSubscription;
    // since the api calls are done inside of listen block we need a completer to complete the request.
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity!.onConnectivityChanged.listen((connectivityResult) async{
      // We're connected either to WiFi or mobile data
      if(connectivityResult != ConnectivityResult.none){
        // Ensure that only one retry happens per connectivity change by cancelling the listener
        streamSubscription!.cancel();
        responseCompleter.complete(
            dio!.request(
                requestOptions.path,
                cancelToken: requestOptions.cancelToken,
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
                onReceiveProgress: requestOptions.onReceiveProgress,
                onSendProgress: requestOptions.onSendProgress,
                options: Options(
                    headers: requestOptions.headers,
                    contentType: requestOptions.contentType,
                    responseType: requestOptions.responseType,
                    method: requestOptions.method
                )
            )
        );
        // the failed request's data into the new request
      }
    });
    return responseCompleter.future;
  }
}