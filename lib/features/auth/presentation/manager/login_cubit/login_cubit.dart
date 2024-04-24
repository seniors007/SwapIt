import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio; // Importing dio and aliasing it
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/auth/data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> authenticateUser(
      {required String userName, required String password}) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = '$kApiUrl/authenticate';
    final loginData = LoginModel(username: 'TomasEssam', password: 'To@@ma\$1');
    final Map<String, dynamic> data = loginData.toJson();

    emit(LoginLoading());

    try {
      final dio.Response response = await _dio.post(apiUrl, data: data);

      if (response.statusCode == 200) {
        emit(LoginSuccess());
        //debugPrint('Response: ${response.data}');
      } else {
        debugPrint('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(LoginFailure());
      debugPrint('Error: $e');
    }
  }
}
