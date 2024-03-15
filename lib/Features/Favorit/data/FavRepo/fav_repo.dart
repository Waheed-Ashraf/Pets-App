import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';

abstract class FavRepo {
  Future<Either<Failure, List<dynamic>>> fetchFavoritList(
      {required String breedsId});
}
