import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

abstract class FavRepo {
  Future<Either<Failure, int>> addToFavoritList({required String breedsId});
  Future<Either<Failure, int>> addDogToFavoritList({required String breedsId});

  Future<Either<Failure, String>> deleteFromFavoritList(
      {required int favItemId});
  Future<Either<Failure, String>> deleteDogFromFavoritList(
      {required int favItemId});

  Future<Either<Failure, List<FavoritModel>>> fetchCatsFivoritsList();
  Future<Either<Failure, List<FavoritModel>>> fetchDogsFivoritsList();
}
