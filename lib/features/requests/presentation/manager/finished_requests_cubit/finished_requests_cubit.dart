import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:swapit/features/requests/presentation/manager/finished_requests_cubit/finished_requests_state.dart';

import '../../../data/finished_requests_response_model/finished_requests_response_model.dart';

class FinishedRequestsCubit extends Cubit<FinishedRequestsState> {
  FinishedRequestsCubit() : super(FinishedRequestsInitial());

  Future<void> getFinishedCustomerServices({required int customerId}) async {
    emit(FinishedRequestsLoading());

    final String apiUrl =
        'http://localhost:5204/api/services/GetAllFinishedCustomer?customerId=$customerId';

    try {
      final response = await dio.Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final finishedRequests =
            FinishedRequestContainer.fromJson(data).finishedRequests;
        emit(FinishedRequestsSuccess(finishedRequests: finishedRequests));
      } else {
        emit(const FinishedRequestsFailure(
            errMsg: 'Failed to load finished customer services'));
      }
    } catch (e) {
      emit(FinishedRequestsFailure(errMsg: e.toString()));
    }
  }
}
