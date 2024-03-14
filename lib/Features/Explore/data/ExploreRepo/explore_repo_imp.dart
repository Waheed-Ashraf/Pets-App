import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Core/network/api_constance.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';
import 'package:pets_app/Features/Explore/data/ExploreRepo/explore_repo.dart';

class ExploreRepoImp implements ExploreRepo {
  final ApiService _apiService;

  ExploreRepoImp(this._apiService);
  @override
  Future<Either<Failure, List<ImageModel>>> fetchExploreImagesList() async {
    try {
      var catsImages =
          await _apiService.get(endPoint: ApiConstance.catsImagesList);
      var dogsImages =
          await _apiService.get(endPoint: ApiConstance.dogsImagesList);

      List<ImageModel> itemData = [];
      for (var element in catsImages) {
        itemData.add(ImageModel.fromJson(element));
      }
      for (var element in dogsImages) {
        itemData.add(ImageModel.fromJson(element));
      }
      // Shuffle the list randomly
      itemData.shuffle();

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
