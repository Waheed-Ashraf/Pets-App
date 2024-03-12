import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/data/Models/SearchCatsModels/search_cats_model.dart';

abstract class DogsRepo {
  Future<Either<Failure, List<CatModel>>> fetchDogsBreedsList();
  Future<Either<Failure, List<SearchCatBreedModel>>>
      fetchSearchedDogsBreedsList({required String breedsId});
}
