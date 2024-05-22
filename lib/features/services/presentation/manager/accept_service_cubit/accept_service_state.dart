part of 'accept_service_cubit.dart';

sealed class AcceptServiceState extends Equatable {
  const AcceptServiceState();

  @override
  List<Object> get props => [];
}

final class AcceptServiceInitial extends AcceptServiceState {}

final class AcceptServiceLoading extends AcceptServiceState {}

final class AcceptServiceSuccess extends AcceptServiceState {}

final class AcceptServiceFailure extends AcceptServiceState {
  final String errMsg;

  const AcceptServiceFailure({required this.errMsg});
}
