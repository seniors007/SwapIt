part of 'pending_services_cubit.dart';

sealed class PendingServicesState extends Equatable {
  const PendingServicesState();

  @override
  List<Object> get props => [];
}

final class PendingServicesInitial extends PendingServicesState {}

final class PendingServicesloading extends PendingServicesState {}

final class PendingServicesSuccess extends PendingServicesState {
  final List<PendingService> pendingServices;

  const PendingServicesSuccess({required this.pendingServices});
}

final class PendingServicesFailure extends PendingServicesState {
  final String errMsg;

  const PendingServicesFailure({required this.errMsg});
}
