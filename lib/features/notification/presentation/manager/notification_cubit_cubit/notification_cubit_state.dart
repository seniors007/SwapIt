import 'package:equatable/equatable.dart';
import '../../../data/notification_model/notification_model.dart';

abstract class NotificationCubitState extends Equatable {
  const NotificationCubitState();

  @override
  List<Object> get props => [];
}

class NotificationCubitInitial extends NotificationCubitState {}

class NotificationCubitLoading extends NotificationCubitState {}

class NotificationCubitSuccess extends NotificationCubitState {
  final List<NotificationModel> notifications;

  const NotificationCubitSuccess({required this.notifications});

  @override
  List<Object> get props => [notifications];
}

class NotificationCubitFailure extends NotificationCubitState {
  final String error;

  const NotificationCubitFailure({required this.error});

  @override
  List<Object> get props => [error];
}
