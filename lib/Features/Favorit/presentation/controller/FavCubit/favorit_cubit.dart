import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavRepo _favRepo;
  FavoritCubit(this._favRepo) : super(FavoritInitial());

  bool itemAddedToFav = false;

  Future fetchFavoritList({required String breedsId}) async {
    if (itemAddedToFav) {
      var data = await _favRepo.fetchFavoritList(breedsId: breedsId);
      data.fold((l) => emit(FavoritError(l.errMessage)),
          (r) => emit(FavoritItemAdded(favList: r)));
    } else {}
  }
}
