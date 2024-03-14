part of 'explore_cubit.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreImagesLoaded extends ExploreState {
  final List<ImageModel> exploreImagesList;

  const ExploreImagesLoaded({required this.exploreImagesList});
}

final class ExploreImagesLoading extends ExploreState {}

final class ExploreImagesFailuer extends ExploreState {
  final String errorMessage;

  const ExploreImagesFailuer({required this.errorMessage});
}
