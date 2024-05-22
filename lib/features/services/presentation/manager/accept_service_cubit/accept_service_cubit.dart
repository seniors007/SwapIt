import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';

part 'accept_service_state.dart';

class AcceptServiceCubitCubit extends Cubit<AcceptServiceCubitState> {
  AcceptServiceCubitCubit() : super(AcceptServiceInitial());

  Future<void> acceptService(
      {required int serviceId, required int providerId}) async {
    final dio.Dio _dio = dio.Dio();
    String apiUrl =
        'http://localhost:5204/api/serviceRequests/AcceptServiceRequest?ServiceRequestId=$serviceId';

    emit(AcceptServiceLoading());
    try {
      final dio.Response response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        emit(AcceptServiceSuccess());
      } else {
        emit(const AcceptServiceFailure(errMsg: 'Failed to accept service'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const AcceptServiceFailure(errMsg: 'An error occurred'));
      log('Error: $e');
    }
  }
}
