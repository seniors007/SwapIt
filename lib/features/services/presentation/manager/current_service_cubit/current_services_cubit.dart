import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swapit/features/services/data/models/pending_services_response_model/services_response_model.dart';
import 'package:dio/dio.dart' as dio;
part 'current_services_state.dart';

class CurrentServiceCubit extends Cubit<CurrentServiceState> {
  CurrentServiceCubit() : super(CurrentServiceInitial());
  Future<void> getCurrentServiceProvider(
      {required int serviceProviderId}) async {
    final dio.Dio _dio = dio.Dio();
    final String apiUrl =
        'http://localhost:5204/api/services/GetAllAcceptedServiceProvider?serviceProviderId=$serviceProviderId';

    emit(CurrentServiceLoading());
    try {
      final dio.Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final pendingServicesContainer =
            ServiceResponseContainer.fromJson(response.data);
        emit(CurrentServiceSuccess(
            pendingServices: pendingServicesContainer.pendingServices));
      } else {
        emit(const CurrentServiceFailure(errMsg: 'Failed to load data'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const CurrentServiceFailure(errMsg: 'An error occurred'));
      log('Error: $e');
    }
  }
}
