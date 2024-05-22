part of 'accept_service_cubit.dart';

sealed class AcceptServiceCubitState extends Equatable {
  const AcceptServiceCubitState();

  @override
  List<Object> get props => [];
}

final class AcceptServiceInitial extends AcceptServiceCubitState {}

final class AcceptServiceLoading extends AcceptServiceCubitState {}

final class AcceptServiceSuccess extends AcceptServiceCubitState {
  
}

final class AcceptServiceFailure extends AcceptServiceCubitState {
  final String errMsg;

  const AcceptServiceFailure({required this.errMsg});
}
