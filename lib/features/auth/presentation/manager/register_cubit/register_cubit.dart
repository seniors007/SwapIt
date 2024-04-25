import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart' as dio;
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({
    required String userName,
    required String password,
  }) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/users/create';
    final Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "roleid": 'admin',
    };

    emit(RegisterLoading());

    try {
      final dio.Response response = await _dio.post(
        apiUrl,
        data: data,
        // options: dio.Options(
        //   contentType: dio.Headers.jsonContentType,
        // ),
      );

      if (response.statusCode == 200) {
        emit(RegisterSuccess());
        debugPrint('Response: ${response.data}');
      } else {
        emit(RegisterFailure(errMsg: 'Failed to register user'));
        debugPrint('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(RegisterFailure(errMsg: 'This Account Already Exists'));
      debugPrint('Error: $e');
    }
  }
}
