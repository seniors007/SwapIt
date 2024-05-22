import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';

part 'cancel_service_state.dart';

class CancelServiceCubit extends Cubit<CancelServiceState> {
  CancelServiceCubit() : super(CancelServiceInitial());

  Future<void> cancelService(
      {required int serviceId, required int userId}) async {
    final dio.Dio _dio = dio.Dio();
    String apiUrl =
        'http://localhost:5204/api/serviceRequests/CancelServiceRequest?ServiceRequestId=$serviceId&userId=$userId';

    emit(CancelServiceLoading());
    try {
      final dio.Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        emit(CancelServiceSuccess());
      } else {
        emit(const CancelServiceFailure(errMsg: 'Failed to accept service'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const CancelServiceFailure(errMsg: 'An error occurred'));
      log('Error: $e');
  }
}
}