part of 'get_user_cubit.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}

final class GetUserLoading extends GetUserState {}

final class GetUserSuccess extends GetUserState {
  final GetUserModel user;

  const GetUserSuccess(this.user);
}

final class GetUserFailure extends GetUserState {
  final String message;

  const GetUserFailure(this.message);
}
