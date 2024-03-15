import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavRepo _favRepo;
  FavoritCubit(this._favRepo) : super(FavoritInitial());

  bool itemAddedToFav = false;

  Future fetchFavoritList({required String imageId}) async {
    if (itemAddedToFav) {
      var data = await _favRepo.fetchFavoritList(breedsId: imageId);
      data.fold((l) => emit(FavoritError(l.errMessage)),
          (r) => emit(FavoritItemAdded(favList: r)));
    } else {}
  }
}
