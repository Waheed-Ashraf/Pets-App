import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/Features/Dogs/data/Models/SearchByDogsBreedIdModels/search_by_breeds_model.dart';

abstract class DogsRepo {
  Future<Either<Failure, List<DogModel>>> fetchDogsBreedsList();
  Future<Either<Failure, List<SearchDogsByBreedsIdModel>>>
      fetchSearchedDogsBreedsList({required String breedsId});
}
