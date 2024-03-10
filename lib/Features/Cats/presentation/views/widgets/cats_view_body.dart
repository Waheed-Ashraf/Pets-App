import 'package:flutter/material.dart';
import 'package:pets_app/Core/widgets/custom_search_textfield.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cats_list.dart';

class CatsViewBody extends StatelessWidget {
  const CatsViewBody({super.key});

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
          title: CustomSearchTextField(onTap: () {}),
        ),
        const SliverToBoxAdapter(
          child: CatsList(),
        )
      ],
    );
  }
}
