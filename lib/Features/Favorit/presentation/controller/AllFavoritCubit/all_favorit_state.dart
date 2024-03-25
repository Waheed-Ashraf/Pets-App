part of 'all_favorit_cubit.dart';

sealed class AllFavoritState extends Equatable {
  const AllFavoritState();

  @override
  List<Object> get props => [];
}

final class AllFavoritInitial extends AllFavoritState {}

final class AllFavoritEmpty extends AllFavoritState {}
