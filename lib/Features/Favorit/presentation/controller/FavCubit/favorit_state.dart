part of 'favorit_cubit.dart';

sealed class FavoritState extends Equatable {
  const FavoritState();

  @override
  List<Object> get props => [];
}

final class FavoritInitial extends FavoritState {}

final class FavoritItemAdded extends FavoritState {
  final List<dynamic> favList;

  const FavoritItemAdded({required this.favList});
}

final class FavoritItemDeleted extends FavoritState {
  final List<dynamic> favList;

  const FavoritItemDeleted({required this.favList});
}

final class FavoritError extends FavoritState {
  final String errorMessage;

  const FavoritError(this.errorMessage);
}
