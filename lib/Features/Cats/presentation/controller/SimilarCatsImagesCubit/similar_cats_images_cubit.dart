import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

part 'similar_cats_images_state.dart';

class SimilarCatsImagesCubit extends Cubit<SimilarCatsImagesState> {
  final CatsRepo _catsRepo;
  SimilarCatsImagesCubit(this._catsRepo) : super(SimilarCatsImagesInitial());
  Future getCatsSimilarImages({required String catName}) async {
    emit(SimilarCatsImagesLoading());
    var data = await _catsRepo.fetchSimilarCatsimagesList(catName: catName);
    data.fold((l) => emit(SimilarCatsImagesFailuer(errorMessage: l.errMessage)),
        (r) => emit(SimilarCatsImagesLoaded(similarImagesList: r)));
  }
}
