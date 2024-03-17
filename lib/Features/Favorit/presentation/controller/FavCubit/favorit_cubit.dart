import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavRepo _favRepo;
  FavoritCubit(this._favRepo) : super(FavoritInitial());
  Set<String> favoritBreedsIds = {};
  Future fetchFavoritList() async {
    emit(FavoritItemLoading());
    var data = await _favRepo.fetchAllFivoritsList();
    data.fold((l) => emit(FavoritError(l.errMessage)),
        (r) => emit(FavoritItemLoaded(favList: r)));
  }

  Future addItemToFavoritList(String breedsId) async {
    var data = await _favRepo.addToFavoritList(breedsId: breedsId);
    favoritBreedsIds.add(breedsId);

    data.fold((l) => emit(FavoritError(l.errMessage)),
        (r) => emit(const FavoritItemAdded()));
  }

  Future deletItemFromFavoritList(int favItemId) async {
    await _favRepo.deleteFromFavoritList(favItemId: favItemId);
  }

  // Future addOrDeletItemFromFavoritList(
  //     {int? favItemId, String? breedsId}) async {
  //   if (_favRepo.favoritItemsIds().contains(favItemId)) {
  //     await _favRepo.deleteFromFavoritList(favItemId: favItemId!);
  //   } else {
  //     await _favRepo.addToFavoritList(breedsId: breedsId!);
  //   }
  // }
}
