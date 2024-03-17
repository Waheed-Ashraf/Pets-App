import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavRepo _favRepo;
  FavoritCubit(this._favRepo) : super(FavoritInitial());
  List<int> favitemsIds = [];
  Future fetchFavoritList() async {
    var data = await _favRepo.fetchAllFivoritsList();
    data.fold((l) => emit(FavoritError(l.errMessage)), (r) {
      emit(FavoritItemLoaded(favList: r));
    });
  }

  Future addItemToFavoritList(String breedsId) async {
    var data = await _favRepo.addToFavoritList(breedsId: breedsId);
    data.fold((l) => emit(FavoritError(l.errMessage)),
        (r) => emit(FavoritItemAdded(addedMessage: r)));
  }

  Future deletItemFromFavoritList(String favItemId) async {
    var data = await _favRepo.deleteFromFavoritList(favItemId: favItemId);
    data.fold((l) => emit(FavoritError(l.errMessage)),
        (r) => emit(FavoritItemDeleted(deletedMessage: r)));
  }
}
