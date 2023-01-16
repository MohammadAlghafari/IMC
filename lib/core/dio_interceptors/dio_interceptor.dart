import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:imc/Auth/data/api/auth_api_handler.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/core/dio_interceptors/dio_request_retrier.dart';
import 'package:imc/core/model/user_model.dart';
import 'package:imc/core/service/api_routes.dart';


class DioInterceptorUtil {

  static final Connectivity connectivity = Connectivity();
  static int _loginAttempts = 0;
  static int _maxLoginAttempts = 5;

  static void addInterceptor(Dio _dio) {

    DioConnectivityRequestRetrier _dioConnectivityRequestRetrier = DioConnectivityRequestRetrier(dio: _dio, connectivity: connectivity);

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {

          String? accessToken = AuthHiveHelper.getAccessTokenFromHive;
          // options.baseUrl = "${APIRoutes.baseUrl}";
          // options.contentType = "application/x-www-form-urlencoded";
          options.contentType = "application/json";

          options.headers['Authorization'] = "Bearer $accessToken";


          log("BASE URL -${options.baseUrl}");
          log("METHOD - ${options.method}");
          log("BODY DATA - ${options.data}");
          log("Headers - ${options.headers}");
          log("QUERY - ${options.queryParameters}");
          log("PATH - ${options.path}");

          return handler.next(options);
        },
        onResponse: (response, handler){
          log("Response DATA - ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) async {
          log("ERROR===${error.requestOptions.path}");
          log("ERROR RESPONSE - ${error.response}");
          log("ERROR MESSAGE - ${error.message}");
          log("ERROR - ${error.error}");
          if(error.requestOptions.path != APIRoutes.login){
          if (( error.response?.statusCode == 403 ||
              error.response?.statusCode == 401 || error.response?.statusCode == 302)) {
            try {
              await _getAccessTokenAgain();
              var newRequest = await _retryApiCall(_dio, error.requestOptions);
              return handler.resolve(newRequest);
            }
            catch(e){
              return handler.reject(error);
            }
          }
          else if(_shouldRetry(error)){
            var newRequest = await _dioConnectivityRequestRetrier.scheduleRequestRetry(error.requestOptions);
            return handler.resolve(newRequest);
          }
          _loginAttempts = 0; // again resetting login attempts
          }
          return handler.reject(error);
        }));
    // _dio.interceptors.add(DioLogInterceptor());

  }

  // To only retry if there is a problem with socket connection.
  static bool _shouldRetry(DioError error){
    return error.type == DioErrorType.other
        && error.error != null
        && error.error is SocketException ;
  }

  // This function will return a new accessToken if the token gets expired.
  static Future<void> _getAccessTokenAgain() async {
    if(_loginAttempts >= _maxLoginAttempts){
      throw Exception("Max Hits Reached");
    }

    try {
      String oldRefreshToken = AuthHiveHelper.getRefreshTokenFromHive!;

      // Fetching details using the login api
      Token? response = await AuthApiHandler().getRefreshToken(oldRefreshToken: oldRefreshToken);
      // setting up the new access token
      AuthHiveHelper.saveAccessTokenInHive(response!.accessToken);
      AuthHiveHelper.saveRefreshTokenInHive(response.refreshToken);
      _loginAttempts++;
    } catch (e) {
      log("An Error Occurred while fetching new access Token");
      throw e;
    }
  }

  // If the token was expired we are hitting the retry api to call the api again.
  static Future<Response<dynamic>> _retryApiCall(
      Dio _dio, RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }


  // THis function will return the caching options for api
  static CacheOptions getCachingOptions({int days = 7}){
    // Global options
    return CacheOptions(
      // A default store is required for interceptor.
      store: MemCacheStore(),

      // All subsequent fields are optional.

      // Default.
      policy: CachePolicy.request,
      // Returns a cached response on error but for statuses 401 & 403.
      // Also allows to return a cached response on network errors (e.g. offline usage).
      // Defaults to [null].
      hitCacheOnErrorExcept: [401, 403],
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: Duration(days: days),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: true,
    );
  }

}