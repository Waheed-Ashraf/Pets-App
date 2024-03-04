import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/presentation/views/cats_view.dart';
import 'package:pets_app/Features/Dogs/presentation/views/dogs_view.dart';
import 'package:pets_app/Features/Favorit/presentation/views/favorit_view.dart';
import 'package:pets_app/Features/Home/presentation/views/home_view.dart';
import 'package:pets_app/Features/Profile/presentation/views/Profile_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List _pages = [];
  int _selectedPageIndex = 2;

  @override
  void initState() {
    _pages = const [
      FavoritView(),
      DogsView(),
      HomeView(),
      CatsView(),
      ProfileView(),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          height: kBottomNavigationBarHeight * 1.2,
          color: Theme.of(context).colorScheme.primary,
          shape: const CircularNotchedRectangle(),
          notchMargin: 0.1,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            onTap: _selectPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            unselectedItemColor: Colors.grey.shade400,
            selectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorit',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.dog),
                label: 'Dogs',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.cat,
                ),
                label: 'Cats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 0,
          backgroundColor: Colors.transparent,
          // splashColor: Colors.grey,
          tooltip: 'Explore',
          elevation: 0,
          child: Icon(
            FontAwesomeIcons.paw,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
