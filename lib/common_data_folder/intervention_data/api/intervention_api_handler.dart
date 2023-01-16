import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/common_data_folder/intervention_data/repositories/intervention_repository.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/service/api_routes.dart';

class InterventionApiHandler implements InterventionRepository{

  static Dio _dio = GetIt.I<Dio>();


  /// The function [getListOfTechnicianInterventionByDateRange] will return the list of intervention of a technician for a particular date range
  @override
  Future<List<Records>?> getListOfTechnicianInterventionByDateRange(String startDate, String endDate) async{
    try{
      Map<String, dynamic> _body = {
        "start_date": startDate,
        "end_date": endDate
      };

      Response response = await _dio.post(
          APIRoutes.getInterventionByDateRangeUrl,
          data: _body,
      );

      InterventionRecordModel intervention = InterventionRecordModel.fromJson(response.data);
      return intervention.records;
    }
    catch(e, stacktrace){
      log("planning_month_api_handler - $stacktrace");
      throw e;
    }
  }


  /// The function [getInterventionListOnMaps] will return the list of intervention of a technician
  /// on a map for a today
  @override
  Future<List<Records>?> getInterventionListOnMaps() async{
    try{
      Response response = await _dio.post(APIRoutes.getInterventionOnMapsUrl);

      InterventionRecordModel intervention = InterventionRecordModel.fromJson(response.data);
      return intervention.records;
    }
    catch(e, stacktrace){
      log("planning_month_api_handler - $stacktrace");
      throw e;
    }
  }





}