import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../../data/requests_response_model/requests_response_model.dart';
import 'pending_requests_state.dart';

class PendingRequestsCubit extends Cubit<PendingRequestsState> {
  PendingRequestsCubit() : super(PendingRequestsInitial());

  final Dio _dio = Dio();

  Future<void> getPendingRequests({required int customerId}) async {
    emit(PendingRequestsLoading());
    try {
      final response = await _dio.get(
          'http://localhost:5204/api/services/GetAllPendingCustomer?customerId=$customerId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<RequestResponseModel> requests =
            data.map((json) => RequestResponseModel.fromJson(json)).toList();
        emit(PendingRequestsSuccess(requests));
      } else {
        throw Exception('Failed to load pending requests');
      }
    } catch (e) {
      emit(PendingRequestsFailure('Failed to fetch pending requests: $e'));
    }
  }
}
