import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Core/network/api_constance.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';

class FavRepoImp implements FavRepo {
  final ApiService _apiService;

  FavRepoImp(this._apiService);
  @override
  Future<Either<Failure, int>> addToFavoritList(
      {required String breedsId}) async {
    try {
      var favItem = await _apiService.post(
          endPoint: ApiConstance.catsFavEndPoin,
          body: {
            'image_id': breedsId,
          },
          apiKey: ApiConstance.apiKey);
      return right(favItem["id"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, int>> addDogToFavoritList(
      {required String breedsId}) async {
    try {
      var favItem = await _apiService.post(
          endPoint: ApiConstance.dogsFavEndPoin,
          body: {
            'image_id': breedsId,
          },
          apiKey: ApiConstance.dogsApiKey);
      return right(favItem["id"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteFromFavoritList(
      {required int favItemId}) async {
    try {
      var fevItem = await _apiService.delete(
          endPoint: ApiConstance.deletCatItmeEndPoint(favItemId: favItemId),
          apiKey: ApiConstance.apiKey);
      return right(fevItem['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteDogFromFavoritList(
      {required int favItemId}) async {
    try {
      var fevItem = await _apiService.delete(
          endPoint: ApiConstance.deletDogItmeEndPoint(favItemId: favItemId),
          apiKey: ApiConstance.dogsApiKey);
      return right(fevItem['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<FavoritModel>>> fetchCatsFivoritsList() async {
    try {
      var data = await _apiService.get(
          endPoint: ApiConstance.catsFavEndPoin, apiKey: ApiConstance.apiKey);

      List<FavoritModel> itemData = [];
      for (var element in data) {
        itemData.add(FavoritModel.fromJson(element));
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
  Future<Either<Failure, List<FavoritModel>>> fetchDogsFivoritsList() async {
    try {
      var dogsData = await _apiService.get(
          endPoint: ApiConstance.dogsFavEndPoin,
          apiKey: ApiConstance.dogsApiKey);

      List<FavoritModel> itemData = [];

      for (var element in dogsData) {
        itemData.add(FavoritModel.fromJson(element));
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
