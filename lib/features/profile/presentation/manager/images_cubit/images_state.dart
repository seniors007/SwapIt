part of 'images_cubit.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object> get props => [];
}

class ImagesInitial extends ImagesState {}

class ImagesLoading extends ImagesState {}

class ImagesSuccess extends ImagesState {
  final List<ImagesModel> images;

  const ImagesSuccess(this.images);

  @override
  List<Object> get props => [images];
}

class ImagesFailure extends ImagesState {
  final String message;

  const ImagesFailure(this.message);

  @override
  List<Object> get props => [message];
}
