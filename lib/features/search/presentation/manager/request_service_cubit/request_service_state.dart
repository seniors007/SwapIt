part of 'request_service_cubit.dart';

abstract class RequestServiceState extends Equatable {
  const RequestServiceState();

  @override
  List<Object> get props => [];
}

class RequestServiceInitial extends RequestServiceState {}

class RequestServiceLoading extends RequestServiceState {}

class RequestServiceSuccess extends RequestServiceState {}

class RequestServiceFailure extends RequestServiceState {
  final String errMsg;

  const RequestServiceFailure({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
