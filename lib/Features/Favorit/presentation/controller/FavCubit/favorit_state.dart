part of 'favorit_cubit.dart';

sealed class FavoritState extends Equatable {
  const FavoritState();

  @override
  List<Object> get props => [];
}

final class FavoritInitial extends FavoritState {}

final class FavoritItemLoaded extends FavoritState {
  final List<FavoritModel> favList;

  const FavoritItemLoaded({required this.favList});
}

final class FavoritItemAdded extends FavoritState {
  final String addedMessage;

  const FavoritItemAdded({required this.addedMessage});
}

final class FavoritItemDeleted extends FavoritState {
  final String deletedMessage;

  const FavoritItemDeleted({required this.deletedMessage});
}

final class FavoritItemLoading extends FavoritState {}

final class FavoritError extends FavoritState {
  final String errorMessage;

  const FavoritError(this.errorMessage);
}
