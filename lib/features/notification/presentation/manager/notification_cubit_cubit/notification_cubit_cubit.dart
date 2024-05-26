import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:swapit/features/notification/presentation/manager/notification_cubit_cubit/notification_cubit_state.dart';
import '../../../data/notification_model/notification_model.dart';

class NotificationCubit extends Cubit<NotificationCubitState> {
  NotificationCubit() : super(NotificationCubitInitial());

  Future<void> getNotifications({required int userId}) async {
    emit(NotificationCubitLoading());

    final String apiUrl =
        'http://localhost:5204/api/notification/getall?userId=$userId';

    try {
      final response = await dio.Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final notifications =
            data.map((json) => NotificationModel.fromJson(json)).toList();
        emit(NotificationCubitSuccess(notifications: notifications));
      } else {
        emit(const NotificationCubitFailure(
            error: 'Failed to load notifications'));
      }
    } catch (e) {
      emit(const NotificationCubitFailure(error: 'An error occurred'));
    }
  }
}
