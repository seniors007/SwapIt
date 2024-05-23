part of 'current_requests_cubit.dart';

sealed class CurrentRequestsState extends Equatable {
  const CurrentRequestsState();

  @override
  List<Object> get props => [];
}

final class CurrentRequestsInitial extends CurrentRequestsState {}

final class CurrentRequestsLoading extends CurrentRequestsState {}

final class CurrentRequestsSuccess extends CurrentRequestsState {
  final List<RequestResponseModel> currentServices;

  const CurrentRequestsSuccess({required this.currentServices});

  @override
  List<Object> get props => [currentServices];
}

final class CurrentRequestsFailure extends CurrentRequestsState {
  final String errMsg;

  const CurrentRequestsFailure({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
