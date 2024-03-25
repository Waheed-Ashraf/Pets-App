import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCatCubit/favorit_cubit.dart';

part 'favorit_dogs_state.dart';

class FavoritDogsCubit extends Cubit<FavoritDogsState> {
  final FavRepo _favRepo;

  FavoritDogsCubit(this._favRepo) : super(FavoritDogsInitial());
  Future fetchDogsFavoritList() async {
    emit(FavoritDogsListLoading());
    var data = await _favRepo.fetchDogsFivoritsList();
    data.fold((l) => emit(FavoritDogsError(l.errMessage)), (r) {
      if (r.isEmpty) {
        emit(const FavoritDogsListEmpty());
      } else {
        emit(FavoritDogsListLoaded(favList: r));
      }
    });
  }

  Future addDogToFavoritList(String breedsId) async {
    var data = await _favRepo.addDogToFavoritList(breedsId: breedsId);

    data.fold((l) => emit(FavoritDogsError(l.errMessage)), (r) {
      favoritItemsIds.add(r);
      favoritBreedsIds.add(breedsId);
      favoritDogsIds.add(breedsId);

      emit(const FavoritDogAdded());
    });
  }

  Future deleteDogFromFavoritList(int favItemId) async {
    favoritItemsIds.remove(favItemId);
    await _favRepo.deleteDogFromFavoritList(favItemId: favItemId);
    if (favoritDogsIds.isEmpty) {
      emit(const FavoritDogsListEmpty());
    }
  }
}
