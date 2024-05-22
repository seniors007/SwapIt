import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';
import 'package:swapit/features/services/data/models/pending_services_response_model/pending_services_response_model.dart';

part 'pending_services_state.dart';

class PendingServicesCubit extends Cubit<PendingServicesState> {
  PendingServicesCubit() : super(PendingServicesInitial());

  Future<void> getPendingServiceProvider(
      {required int serviceProviderId}) async {
    final dio.Dio _dio = dio.Dio();
    final String apiUrl =
        'http://localhost:5204/api/services/GetAllPendingServiceProvider?serviceProviderId=$serviceProviderId';

    emit(PendingServicesloading());
    try {
      final dio.Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final pendingServicesContainer =
            PendingServiceContainer.fromJson(response.data);
        emit(PendingServicesSuccess(
            pendingServices: pendingServicesContainer.pendingServices));
      } else {
        emit(const PendingServicesFailure(errMsg: 'Failed to load data'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const PendingServicesFailure(errMsg: 'An error occurred'));
      log('Error: $e');
    }
  }
}
