part of 'favorit_cubit.dart';

sealed class FavoritState extends Equatable {
  const FavoritState();

  @override
  List<Object> get props => [];
}

final class FavoritInitial extends FavoritState {}

final class FavoritCatsListLoaded extends FavoritState {
  final List<FavoritModel> favList;

  const FavoritCatsListLoaded({required this.favList});
}

final class FavoritCatsListEmpty extends FavoritState {
  const FavoritCatsListEmpty();
}

final class FavoritCatAdded extends FavoritState {
  const FavoritCatAdded();
}

final class FavoritCatDeleted extends FavoritState {
  const FavoritCatDeleted();
}

final class FavoritCatsListLoading extends FavoritState {}

final class FavoritCatsError extends FavoritState {
  final String errorMessage;

  const FavoritCatsError(this.errorMessage);
}
