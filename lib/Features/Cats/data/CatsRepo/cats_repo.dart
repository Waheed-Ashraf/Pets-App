import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/data/Models/SearchCatsModels/search_cats_model.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

abstract class CatsRepo {
  Future<Either<Failure, List<CatModel>>> fetchCatsBreedsList();
  Future<Either<Failure, List<SearchCatBreedModel>>>
      fetchSearchedCatsBreedsList({required String breedsId});

  Future<Either<Failure, List<ImageModel>>> fetchSimilarCatsimagesList(
      {required String catName});
}
