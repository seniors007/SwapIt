import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:swapit/features/home/data/get_user_model/get_user_model.dart';
import 'package:swapit/features/home/presentation/manager/get_user_cubit/get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());
  Future<void> getUser(int userId) async {
    emit(GetUserLoading());
    try {
      final response = await Dio()
          .get('http://localhost:5204/api/users/GetUser?userId=$userId');
      if (response.statusCode == 200) {
        final userJson = json.decode(response.data);
        final user = GetUserModel.fromJson(userJson);
        emit(GetUserSuccess(user));
      } else {
        emit(const GetUserFailure('Failed to load user'));
      }
    } catch (e) {
      log(e.toString());
      emit(const GetUserFailure('Failed to connect to the server'));
    }
  }
}
