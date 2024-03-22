part of 'similar_cats_images_cubit.dart';

sealed class SimilarCatsImagesState extends Equatable {
  const SimilarCatsImagesState();

  @override
  List<Object> get props => [];
}

final class SimilarCatsImagesInitial extends SimilarCatsImagesState {}

final class SimilarCatsImagesLoading extends SimilarCatsImagesState {}

final class SimilarCatsImagesLoaded extends SimilarCatsImagesState {
  final List<ImageModel> similarImagesList;

  const SimilarCatsImagesLoaded({required this.similarImagesList});
}

final class SimilarCatsImagesFailuer extends SimilarCatsImagesState {
  final String errorMessage;

  const SimilarCatsImagesFailuer({required this.errorMessage});
}
