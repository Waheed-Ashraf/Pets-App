part of 'favorit_dogs_cubit.dart';

sealed class FavoritDogsState extends Equatable {
  const FavoritDogsState();

  @override
  List<Object> get props => [];
}

final class FavoritDogsInitial extends FavoritDogsState {}

final class FavoritDogsListLoaded extends FavoritDogsState {
  final List<FavoritModel> favList;

  const FavoritDogsListLoaded({required this.favList});
}

final class FavoritDogsListEmpty extends FavoritDogsState {
  const FavoritDogsListEmpty();
}

final class FavoritDogAdded extends FavoritDogsState {
  const FavoritDogAdded();
}

final class FavoritDogDeleted extends FavoritDogsState {
  const FavoritDogDeleted();
}

final class FavoritDogsListLoading extends FavoritDogsState {}

final class FavoritDogsError extends FavoritDogsState {
  final String errorMessage;

  const FavoritDogsError(this.errorMessage);
}
