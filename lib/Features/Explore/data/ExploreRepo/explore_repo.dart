import 'package:dartz/dartz.dart';
import 'package:pets_app/Core/errors/Failuer.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

abstract class ExploreRepo {
  Future<Either<Failure, List<ImageModel>>> fetchExploreImagesList();
}
