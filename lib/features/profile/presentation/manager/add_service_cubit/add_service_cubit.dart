import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meta/meta.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());

  Future<void> addService({
    required int categoryId,
    required String serviceName,
    required String serviceDescription,
    required int price,
    required int serviceProviderId,
    required File serviceImage,
  }) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/services/Create';

    final dio.FormData formData = dio.FormData.fromMap({
      "name": serviceName,
      "description": serviceDescription,
      "price": price,
      "timeToExecute": 15,
      "serviceProviderId": serviceProviderId,
      "categoryId": categoryId,
      "serviceImage": await dio.MultipartFile.fromFile(serviceImage.path,
          filename: "service_image.jpg"),
    });

    emit(AddServiceLoading());

    try {
      final dio.Response response = await _dio.post(apiUrl, data: formData);
      if (response.statusCode == 200) {
        emit(AddServiceSuccess());
        log('Success');
      } else {
        emit(AddServiceFailure(errMsg: 'Failed to create service'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(AddServiceFailure(errMsg: 'Failed to create service'));
      log('Error: $e');
    }
  }
}
