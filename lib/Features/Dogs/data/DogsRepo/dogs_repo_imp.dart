import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Core/network/api_constance.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Dogs/data/DogsRepo/dogs_repo.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/Features/Dogs/data/Models/SearchByDogsBreedIdModels/search_by_breeds_model.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

class DogsRepoImp implements DogsRepo {
  final ApiService _apiService;

  DogsRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<DogModel>>> fetchDogsBreedsList() async {
    try {
      var data = await _apiService.get(endPoint: ApiConstance.dogBreedsList);
      List<DogModel> itemData = [];
      for (var element in data) {
        itemData.add(DogModel.fromJson(element));
      }
      return right(itemData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SearchDogsByBreedsIdModel>>>
      fetchSearchedDogsBreedsList({required String breedsId}) async {
    try {
      var data = await _apiService.get(
          endPoint: ApiConstance.searchByDogBreedsId(breedsId));
      List<SearchDogsByBreedsIdModel> itemData = [];
      for (var element in data) {
        itemData.add(SearchDogsByBreedsIdModel.fromJson(element));
      }
      return right(itemData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchSimilarDogsimagesList(
      {required String dogName}) async {
    try {
      var data = await _apiService.get(
          endPoint: ApiConstance.dogsSimilarImagesEndPoint(petName: dogName));
      List<ImageModel> itemData = [];
      for (var element in data) {
        itemData.add(ImageModel.fromJson(element));
      }
      return right(itemData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
