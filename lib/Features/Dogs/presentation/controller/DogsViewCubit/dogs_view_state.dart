part of 'dogs_view_cubit.dart';

sealed class DogsViewState extends Equatable {
  const DogsViewState();

  @override
  List<Object> get props => [];
}

final class DogsViewInitial extends DogsViewState {}

final class DogsBreedsLoaded extends DogsViewState {
  final List<DogModel> dogsBreedsList;

  const DogsBreedsLoaded({required this.dogsBreedsList});
}

final class SearchedDogsBreedsLoaded extends DogsViewState {
  final List<SearchDogsByBreedsIdModel> searchDogBreed;

  const SearchedDogsBreedsLoaded({required this.searchDogBreed});
}

final class DogsBreedsLoading extends DogsViewState {}

final class DogsBreedsListEmpty extends DogsViewState {}

final class DogsBreedsFailuer extends DogsViewState {
  final String errorMessage;

  const DogsBreedsFailuer({required this.errorMessage});
}
