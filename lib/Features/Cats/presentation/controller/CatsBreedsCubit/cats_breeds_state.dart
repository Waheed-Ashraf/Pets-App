part of 'cats_breeds_cubit.dart';

sealed class CatsBreedsState extends Equatable {
  const CatsBreedsState();

  @override
  List<Object> get props => [];
}

final class CatsBreedsInitial extends CatsBreedsState {}

final class CatsBreedsLoaded extends CatsBreedsState {
  final List<CatModel> catsBreedsList;

  const CatsBreedsLoaded({required this.catsBreedsList});
}

final class SearchedCatsBreedsLoaded extends CatsBreedsState {
  final List<SearchCatBreedModel> searchCatBreed;

  const SearchedCatsBreedsLoaded({required this.searchCatBreed});
}

final class CatsBreedsLoading extends CatsBreedsState {}

final class CatsBreedsListEmpty extends CatsBreedsState {}

final class CatsBreedsFailuer extends CatsBreedsState {
  final String errorMessage;

  const CatsBreedsFailuer({required this.errorMessage});
}
