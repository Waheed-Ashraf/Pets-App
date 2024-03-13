import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Dogs/data/DogsRepo/dogs_repo.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/Features/Dogs/data/Models/SearchByDogsBreedIdModels/search_by_breeds_model.dart';

part 'dogs_view_state.dart';

class DogsViewCubit extends Cubit<DogsViewState> {
  final DogsRepo _dogsRepo;
  DogsViewCubit(this._dogsRepo) : super(DogsViewInitial());

  Future getDogsBreedsList() async {
    var data = await _dogsRepo.fetchDogsBreedsList();

    data.fold(
        (failure) => emit(DogsBreedsFailuer(errorMessage: failure.errMessage)),
        (dogsBreedsList) =>
            emit(DogsBreedsLoaded(dogsBreedsList: dogsBreedsList)));
  }

  Future getSearchedDogsBreedsList({required String breedsId}) async {
    emit(DogsBreedsLoading());
    var searcheddata =
        await _dogsRepo.fetchSearchedDogsBreedsList(breedsId: breedsId);
    if (searcheddata.length() != 0) {
      searcheddata.fold(
          (failure) =>
              emit(DogsBreedsFailuer(errorMessage: failure.errMessage)),
          (searchedDogsBreeds) => emit(
              SearchedDogsBreedsLoaded(searchDogBreed: searchedDogsBreeds)));
    } else {
      emit(DogsBreedsListEmpty());
    }
  }
}
