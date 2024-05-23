part of 'finished_services_cubit.dart';

sealed class FinishedServicesState extends Equatable {
  const FinishedServicesState();

  @override
  List<Object> get props => [];
}

final class FinishedServicesInitial extends FinishedServicesState {}

final class FinishedServicesLoading extends FinishedServicesState {}

final class FinishedServicesSuccess extends FinishedServicesState {
  final List<FinishedServiceResponseModel> finishedServices;

  const FinishedServicesSuccess({required this.finishedServices});
}

final class FinishedServicesFailure extends FinishedServicesState {
  final String errMsg;

  const FinishedServicesFailure({required this.errMsg});
}
