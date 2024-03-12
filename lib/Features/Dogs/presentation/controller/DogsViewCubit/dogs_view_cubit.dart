import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';

part 'dogs_view_state.dart';

class DogsViewCubit extends Cubit<DogsViewState> {
  DogsViewCubit() : super(DogsViewInitial());
}
