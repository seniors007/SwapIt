import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';
import 'package:swapit/features/services/data/models/finised_service_response_model/finised_service_response_model.dart';

part 'finished_services_state.dart';

class FinishedServicesCubit extends Cubit<FinishedServicesState> {
  FinishedServicesCubit() : super(FinishedServicesInitial());

  Future<void> getFinishedServiceProvider(
      {required int serviceProviderId}) async {
    final dio.Dio _dio = dio.Dio();
    final String apiUrl =
        'http://localhost:5204/api/services/GetAllFinishedServiceProvider?serviceProviderId=$serviceProviderId';

    emit(FinishedServicesLoading());
    try {
      final dio.Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final finishedServicesContainer =
            FinishedServiceResponseContainer.fromJson(response.data);
        emit(FinishedServicesSuccess(
            finishedServices: finishedServicesContainer.finishedServices));
      } else {
        emit(const FinishedServicesFailure(errMsg: 'Failed to load data'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const FinishedServicesFailure(errMsg: 'An error occurred'));
      log('Error: $e');
    }
  }
}
