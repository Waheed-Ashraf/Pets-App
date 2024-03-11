import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';

abstract class CatsRepo {
  Future<Either<Failure, List<CatModel>>> fetchCatsBreedsList();
}
