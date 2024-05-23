import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart' as dio;
import 'package:swapit/features/requests/data/requests_response_model/requests_response_model.dart';

part 'current_requests_state.dart';

class CurrentRequestsCubit extends Cubit<CurrentRequestsState> {
  CurrentRequestsCubit() : super(CurrentRequestsInitial());

  Future<void> getCurrentCustomerServices({required int customerId}) async {
    emit(CurrentRequestsLoading());

    final String apiUrl =
        'http://localhost:5204/api/services/GetAllAcceptedCustomer?customerId=$customerId';

    try {
      final response = await dio.Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final acceptedServices =
            RequestResponseContainer.fromJson(data).acceptedRequests;
        emit(CurrentRequestsSuccess(currentServices: acceptedServices));
      } else {
        emit(const CurrentRequestsFailure(
            errMsg: 'Failed to load accepted customer services'));
      }
    } catch (e) {
      emit(const CurrentRequestsFailure(errMsg: 'An error occurred'));
    }
  }
}
