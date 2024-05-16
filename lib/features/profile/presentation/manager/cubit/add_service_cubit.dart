import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meta/meta.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());

  Future<void> addService() async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/services/Create';

    final Map<String, dynamic> serviceData = {
      "name": "Coashing",
      "description": "I coash in private Session",
      "price": 20,
      "timeToExecute": 15,
      "previousworkImagesUrl": "2.jpg",
      "serviceProviderId": 30,
      "categoryId": 1
    };
    emit(AddServiceLoading());

    try {
      final dio.Response response = await _dio.post(apiUrl, data: serviceData);
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
