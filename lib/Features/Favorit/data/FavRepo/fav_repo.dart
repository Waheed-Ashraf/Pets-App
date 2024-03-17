import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

abstract class FavRepo {
  Future<Either<Failure, List<int>>> addToFavoritList(
      {required String breedsId});

  Future<Either<Failure, String>> deleteFromFavoritList(
      {required int favItemId});

  Future<Either<Failure, List<FavoritModel>>> fetchAllFivoritsList();

  List<int> favoritItemsIds();
}
