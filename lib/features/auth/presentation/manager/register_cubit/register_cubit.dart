import 'dart:developer';
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
    required String email,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
    required String jobTitle,
    required String address,
  }) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/users/create';

    final Map<String, dynamic> registerData = {
      "username": userName,
      "password": password,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "phoneNumber": phoneNumber,
      "jobTitle": jobTitle,
      "profileImagePath": "3.jpg",
      "address": address,
    };

    emit(RegisterLoading());

    log('Register Data: $registerData');

    try {
      final dio.Response response = await _dio.post(
        apiUrl,
        data: registerData,
        options: dio.Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMsg: 'Failed to register user'));
        log('Failed with status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      emit(RegisterFailure(errMsg: 'This Account Already Exists'));
      log('Error: $e');
    }
  }
}
