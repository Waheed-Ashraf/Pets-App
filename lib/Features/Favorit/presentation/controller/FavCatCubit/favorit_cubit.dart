import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavRepo _favRepo;
  FavoritCubit(this._favRepo) : super(FavoritInitial());
  Set<int> favoritItemsIds = {};

  Future fetchCatsFavoritList() async {
    emit(FavoritCatsListLoading());
    var data = await _favRepo.fetchCatsFivoritsList();
    data.fold((l) => emit(FavoritCatsError(l.errMessage)), (r) {
      if (r.isEmpty) {
        emit(const FavoritCatsListEmpty());
      } else {
        emit(FavoritCatsListLoaded(favList: r));
      }
    });
  }

  Future addCatToFavoritList(String breedsId) async {
    var data = await _favRepo.addToFavoritList(breedsId: breedsId);

    data.fold((l) => emit(FavoritCatsError(l.errMessage)), (r) {
      favoritItemsIds.add(r);
      favoritBreedsIds.add(breedsId);
      favoritCatsIds.add(breedsId);

      emit(const FavoritCatAdded());
    });
  }

  Future deletCatFromFavoritList(int favItemId) async {
    favoritItemsIds.remove(favItemId);
    await _favRepo.deleteFromFavoritList(favItemId: favItemId);
    if (favoritBreedsIds.isEmpty) {
      emit(const FavoritCatsListEmpty());
    }
  }
  // Future addDogToFavoritList(String breedsId) async {
  //   var data = await _favRepo.addDogToFavoritList(breedsId: breedsId);

  //   data.fold((l) => emit(FavoritError(l.errMessage)), (r) {
  //     favoritItemsIds.add(r);
  //     favoritDogsIds.add(breedsId);

  //     favoritBreedsIds.add(breedsId);

  //     emit(const FavoritItemAdded());
  //   });
  // }

  // Future deletDogFromFavoritList(int favItemId) async {
  //   favoritItemsIds.remove(favItemId);
  //   await _favRepo.deleteFromFavoritList(favItemId: favItemId);
  //   if (favoritBreedsIds.isEmpty) {
  //     emit(const FavoritListEmpty());
  //   }
  // }
}

Set<String> favoritBreedsIds = {};
Set<String> favoritCatsIds = {};
Set<String> favoritDogsIds = {};
