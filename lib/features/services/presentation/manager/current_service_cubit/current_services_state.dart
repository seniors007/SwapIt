part of 'current_services_cubit.dart';

sealed class CurrentServiceState extends Equatable {
  const CurrentServiceState();

  @override
  List<Object> get props => [];
}

final class CurrentServiceInitial extends CurrentServiceState {}

final class CurrentServiceLoading extends CurrentServiceState {}

final class CurrentServiceSuccess extends CurrentServiceState {
  final List<ServiceResposeModel> pendingServices;

  const CurrentServiceSuccess({required this.pendingServices});
}

final class CurrentServiceFailure extends CurrentServiceState {
  final String errMsg;

  const CurrentServiceFailure({required this.errMsg});
}
