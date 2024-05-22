part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchResponseContainer searchResponseContainer;

  const SearchSuccess({required this.searchResponseContainer});
}

final class SearchFailure extends SearchState {
  final String errMsg;

  const SearchFailure({required this.errMsg});
}
