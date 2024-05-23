import 'package:equatable/equatable.dart';
import '../../../data/finished_requests_response_model/finished_requests_response_model.dart';

sealed class FinishedRequestsState extends Equatable {
  const FinishedRequestsState();

  @override
  List<Object?> get props => [];
}

final class FinishedRequestsInitial extends FinishedRequestsState {}

final class FinishedRequestsLoading extends FinishedRequestsState {}

final class FinishedRequestsSuccess extends FinishedRequestsState {
  final List<FinishedRequestModel> finishedRequests;

  const FinishedRequestsSuccess({required this.finishedRequests});

  @override
  List<Object?> get props => [finishedRequests];
}

final class FinishedRequestsFailure extends FinishedRequestsState {
  final String errMsg;

  const FinishedRequestsFailure({required this.errMsg});

  @override
  List<Object?> get props => [errMsg];
}
