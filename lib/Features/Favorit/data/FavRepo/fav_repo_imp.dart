import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Core/network/api_constance.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';

class FavRepoImp implements FavRepo {
  final ApiService _apiService;

  FavRepoImp(this._apiService);
  @override
  Future<Either<Failure, List>> fetchFavoritList(
      {required String breedsId}) async {
    try {
      var fevItem = await _apiService.post(
          endPoint: ApiConstance.catsFavEndPoin,
          body: {
            'image_id': breedsId,
          },
          apiKey: ApiConstance.apiKey);

      List<dynamic> itemData = [];
      for (var element in fevItem) {
        itemData.add(element);
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
