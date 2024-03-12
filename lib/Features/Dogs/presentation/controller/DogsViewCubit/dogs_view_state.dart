part of 'dogs_view_cubit.dart';

sealed class DogsViewState extends Equatable {
  const DogsViewState();

  @override
  List<Object> get props => [];
}

final class DogsViewInitial extends DogsViewState {}

final class DogsBreedsLoaded extends DogsViewState {
  final List<DogModel> catsBreedsList;

  const DogsBreedsLoaded({required this.catsBreedsList});
}

// final class SearchedCatsBreedsLoaded extends DogsViewState {
//   final List<SearchCatBreedModel> searchCatBreed;

//   const SearchedCatsBreedsLoaded({required this.searchCatBreed});
// }

final class DogsBreedsLoading extends DogsViewState {}

final class DogsBreedsListEmpty extends DogsViewState {}

final class DogsBreedsFailuer extends DogsViewState {
  final String errorMessage;

  const DogsBreedsFailuer({required this.errorMessage});
}
