import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio; // Importing dio and aliasing it
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:swapit/features/auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String userName, required String password}) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/users/authenticate';
    final loginData = LoginModel(username: userName, password: password);
    final Map<String, dynamic> data = loginData.toJson();

    emit(LoginLoading());

    try {
      final dio.Response response = await _dio.post(apiUrl, data: data);

      if (response.statusCode == 200) {
        emit(LoginSuccess());
        debugPrint('Response: ${response.data}');
        // } else if (response.statusCode == 500) {
        //   emit(LoginFailure(errMsg: 'User Name or Password Is Incorrect'));
        //   debugPrint('Failed with status code: ${response.statusCode}');
      } else {
        emit(LoginFailure(errMsg: '${response.statusCode}'));
        debugPrint('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(LoginFailure(errMsg: 'User Name or Password Is Incorrect'));
      debugPrint('Error: $e');
    }
  }
}
