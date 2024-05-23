import 'package:equatable/equatable.dart';
import '../../../data/requests_response_model/requests_response_model.dart';

abstract class PendingRequestsState extends Equatable {
  const PendingRequestsState();

  @override
  List<Object> get props => [];
}

class PendingRequestsInitial extends PendingRequestsState {}

class PendingRequestsLoading extends PendingRequestsState {}

class PendingRequestsSuccess extends PendingRequestsState {
  final List<RequestResponseModel> pendingRequests;

  const PendingRequestsSuccess(this.pendingRequests);

  @override
  List<Object> get props => [pendingRequests];
}

class PendingRequestsFailure extends PendingRequestsState {
  final String message;

  const PendingRequestsFailure(this.message);

  @override
  List<Object> get props => [message];
}
