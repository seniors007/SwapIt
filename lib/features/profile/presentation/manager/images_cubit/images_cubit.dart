import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/images_model/images_model.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final Dio _dio;

  ImagesCubit(this._dio) : super(ImagesInitial());

  Future<void> fetchImages(int userId) async {
    emit(ImagesLoading());
    try {
      final response = await _dio.get(
          'http://localhost:5204/api/users/GetServicesImages?userId=$userId');
      final List<dynamic> data = response.data;
      final images = data.map((json) => ImagesModel.fromJson(json)).toList();
      emit(ImagesSuccess(images));
    } catch (e) {
      emit(const ImagesFailure('Failed to fetch images'));
    }
  }
}
