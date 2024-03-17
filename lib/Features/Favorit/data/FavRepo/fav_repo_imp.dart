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
  Future<Either<Failure, String>> addToFavoritList(
      {required String breedsId}) async {
    try {
      var fevItem = await _apiService.post(
          endPoint: ApiConstance.catsFavEndPoin,
          body: {
            'image_id': breedsId,
          },
          apiKey: ApiConstance.apiKey);

      return fevItem['message'];
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
      {required String favItemId}) async {
    try {
      var fevItem = await _apiService.delete(
          endPoint: ApiConstance.deletCatItmeEndPoint(favItemId: favItemId),
          apiKey: ApiConstance.apiKey);
      return fevItem['message'];
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<FavoritModel>>> fetchAllFivoritsList() async {
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
}
