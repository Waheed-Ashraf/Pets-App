part of 'similar_dogs_images_cubit.dart';

sealed class SimilarDogsImagesState extends Equatable {
  const SimilarDogsImagesState();

  @override
  List<Object> get props => [];
}

final class SimilarDogsImagesInitial extends SimilarDogsImagesState {}

final class SimilarDogsImagesLoading extends SimilarDogsImagesState {}

final class SimilarDogsImagesLoaded extends SimilarDogsImagesState {
  final List<ImageModel> similarImagesList;

  const SimilarDogsImagesLoaded({required this.similarImagesList});
}

final class SimilarDogsImagesFailuer extends SimilarDogsImagesState {
  final String errorMessage;

  const SimilarDogsImagesFailuer({required this.errorMessage});
}
