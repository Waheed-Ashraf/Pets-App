import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Dogs/data/DogsRepo/dogs_repo.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

part 'similar_dogs_images_state.dart';

class SimilarDogsImagesCubit extends Cubit<SimilarDogsImagesState> {
  final DogsRepo _dogsRepo;
  SimilarDogsImagesCubit(this._dogsRepo) : super(SimilarDogsImagesInitial());
  Future getDogsSimilarImages({required String dogName}) async {
    emit(SimilarDogsImagesLoading());
    var data = await _dogsRepo.fetchSimilarDogsimagesList(dogName: dogName);
    data.fold((l) => emit(SimilarDogsImagesFailuer(errorMessage: l.errMessage)),
        (r) => emit(SimilarDogsImagesLoaded(similarImagesList: r)));
  }
}
