part of 'add_service_cubit.dart';

@immutable
sealed class AddServiceState {}

final class AddServiceInitial extends AddServiceState {}

final class AddServiceLoading extends AddServiceState {}

final class AddServiceSuccess extends AddServiceState {}

final class AddServiceFailure extends AddServiceState {
  final String errMsg;

  AddServiceFailure({required this.errMsg});
}
