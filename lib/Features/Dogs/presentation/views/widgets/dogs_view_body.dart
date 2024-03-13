import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Core/widgets/custom_search_textfield.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/DogsViewCubit/dogs_view_cubit.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dogs_list.dart';

class DogsViewBody extends StatelessWidget {
  const DogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          floating: false,
          centerTitle: true,
          pinned: false,
          backgroundColor: Colors.transparent,
          title: CustomSearchTextField(onTap: (String searchedItem) {
            BlocProvider.of<DogsViewCubit>(context)
                .getSearchedDogsBreedsList(breedsId: searchedItem);
          }),
        ),
        const SliverToBoxAdapter(
          child: DogsList(),
        )
      ],
    );
  }
}
