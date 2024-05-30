import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';
import 'package:swapit/features/profile/data/models/search_model/search_model.dart';
import 'package:swapit/features/profile/data/models/search_response/search_response_container.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> searchService(
      {required String serviceName,
      required int servicePrice,
      required int serviceProviderId,
      required int categoryId,
      required int userId}) async {
    final dio.Dio _dio = dio.Dio();
    const String apiUrl = 'http://localhost:5204/api/services/Search';
    final searchData = SearchModel(
      serviceName: serviceName,
      servicePrice: servicePrice,
      serviceProviderId: serviceProviderId,
      categoryId: categoryId,
      userId: userId,
    );
    final Map<String, dynamic> data = searchData.toJson();

    emit(SearchLoading());

    try {
      final dio.Response response = await _dio.post(apiUrl, data: data);

      if (response.statusCode == 200) {
        final searchResponseContainer =
            SearchResponseContainer.fromJson(response.data);
        emit(SearchSuccess(searchResponseContainer: searchResponseContainer));
      } else {
        emit(const SearchFailure(errMsg: 'Failed to load data'));
        log('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      emit(const SearchFailure(errMsg: 'An error occurred'));
      log('Error: $e');
    }
  }
}
