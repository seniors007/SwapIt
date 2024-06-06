import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
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
    required File profileImage,
    required File idImage,
  }) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/users/create';

    final dio.FormData formData = dio.FormData.fromMap({
      "username": userName,
      "password": password,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "phoneNumber": phoneNumber,
      "jobTitle": jobTitle,
      "address": address,
      "profileImage": await dio.MultipartFile.fromFile(profileImage.path,
          filename: "profile_image.jpg"),
      "idImage": await dio.MultipartFile.fromFile(idImage.path,
          filename: "id_image.jpg"),
    });

    emit(RegisterLoading());

    log('Register Data: $formData');

    try {
      final dio.Response response = await _dio.post(
        apiUrl,
        data: formData,
        options: dio.Options(
          headers: {
            'Content-Type': 'multipart/form-data',
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
