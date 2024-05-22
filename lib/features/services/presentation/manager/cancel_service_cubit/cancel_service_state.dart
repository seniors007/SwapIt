part of 'cancel_service_cubit.dart';

sealed class CancelServiceState extends Equatable {
  const CancelServiceState();

  @override
  List<Object> get props => [];
}

final class CancelServiceInitial extends CancelServiceState {}

final class CancelServiceLoading extends CancelServiceState {}

final class CancelServiceSuccess extends CancelServiceState {}

final class CancelServiceFailure extends CancelServiceState {
  final String errMsg;

  const CancelServiceFailure({required this.errMsg});
}
