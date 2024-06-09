import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'request_service_state.dart';

class RequestServiceCubit extends Cubit<RequestServiceState> {
  RequestServiceCubit() : super(RequestServiceInitial());

  Future<void> createServiceRequest({
    required String requestDate,
    required String requestState,
    required int executionTime,
    required int customerId,
    required int serviceId,
    required String notes,
    File? requestImage,
  }) async {
    emit(RequestServiceLoading());
    final Dio dio = Dio();
    const String url = 'http://localhost:5204/api/serviceRequests/Create';

    try {
      FormData formData = FormData.fromMap({
        "requestDate": requestDate,
        "requestState": requestState,
        "executionTime": executionTime,
        "customerId": customerId,
        "serviceId": serviceId,
        "notes": notes,
        if (requestImage != null)
          "requestImage": await MultipartFile.fromFile(requestImage.path,
              filename: "request_image.jpg"),
      });

      final response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        if (response.data == true) {
          emit(const RequestServiceSuccess(true));
        } else {
          emit(const RequestServiceSuccess(false));
        }
        log(response.data.toString());
      } else {
        emit(const RequestServiceFailure(
            errMsg: 'Failed to request service request.'));
      }
    } catch (e) {
      emit(RequestServiceFailure(errMsg: e.toString()));
    }
  }
}
