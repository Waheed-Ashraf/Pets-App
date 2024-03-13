import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo.dart';
import 'package:pets_app/Features/Cats/data/Models/SearchCatsModels/search_cats_model.dart';

part 'cats_breeds_state.dart';

class CatsBreedsCubit extends Cubit<CatsBreedsState> {
  final CatsRepo _catsRepo;
  CatsBreedsCubit(this._catsRepo) : super(CatsBreedsInitial());
  Future getCatsBreedsList() async {
    var data = await _catsRepo.fetchCatsBreedsList();

    data.fold(
        (failure) => emit(CatsBreedsFailuer(errorMessage: failure.errMessage)),
        (catsBreedsList) =>
            emit(CatsBreedsLoaded(catsBreedsList: catsBreedsList)));
  }

  Future getSearchedCatsBreedsList({required String breedsId}) async {
    emit(CatsBreedsLoading());
    var searcheddata =
        await _catsRepo.fetchSearchedCatsBreedsList(breedsId: breedsId);
    searcheddata.fold(
        (failure) => emit(CatsBreedsFailuer(errorMessage: failure.errMessage)),
        (searchedCatsBreeds) {
      if (searchedCatsBreeds.isEmpty) {
        emit(CatsBreedsListEmpty());
      } else {
        emit(SearchedCatsBreedsLoaded(searchCatBreed: searchedCatsBreeds));
      }
    });
  }
}
