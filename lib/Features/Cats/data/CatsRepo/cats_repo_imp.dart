import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Core/network/api_constance.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo.dart';
import 'package:pets_app/Features/Cats/data/Models/SearchCatsModels/search_cats_model.dart';

class CatsRepoImp implements CatsRepo {
  final ApiService _apiService;

  CatsRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<CatModel>>> fetchCatsBreedsList() async {
    try {
      var data = await _apiService.get(endPoint: ApiConstance.catBreedsList);
      List<CatModel> itemData = [];
      for (var element in data) {
        itemData.add(CatModel.fromJson(element));
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
  Future<Either<Failure, List<SearchCatBreedModel>>>
      fetchSearchedCatsBreedsList({required String breedsId}) async {
    try {
      var data = await _apiService.get(
          endPoint: ApiConstance.searchByCatBreedsId(breedsId));
      List<SearchCatBreedModel> itemData = [];
      for (var element in data) {
        itemData.add(SearchCatBreedModel.fromJson(element));
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
