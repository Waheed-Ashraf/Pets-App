import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';
import 'package:pets_app/Features/Explore/data/ExploreRepo/explore_repo.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepo _exploreRepo;
  ExploreCubit(this._exploreRepo) : super(ExploreInitial());
  Future fetchExploreImagesList() async {
    var exploreList = await _exploreRepo.fetchExploreImagesList();
    exploreList.fold(
        (l) => emit(ExploreImagesFailuer(errorMessage: l.errMessage)),
        (r) => emit(ExploreImagesLoaded(exploreImagesList: r)));
  }
}
