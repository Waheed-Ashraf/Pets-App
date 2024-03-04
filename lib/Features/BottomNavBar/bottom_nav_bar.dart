import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/presentation/views/cats_view.dart';
import 'package:pets_app/Features/Dogs/presentation/views/dogs_view.dart';
import 'package:pets_app/Features/Favorit/presentation/views/favorit_view.dart';
import 'package:pets_app/Features/Home/presentation/views/home_view.dart';
import 'package:pets_app/Features/Profile/presentation/views/Profile_view.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List _pages = [];
  int _selectedPageIndex = 0;

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
      bottomNavigationBar: BottomAppBar(
        height: kBottomNavigationBarHeight * 1.5,
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.1,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          onTap: _selectPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: Colors.yellow,
          selectedItemColor: Colors.purple,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              activeIcon: null,
              icon: Icon(null),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Feeds',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Explore',
          elevation: 0,
          child: const Icon(Icons.home),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
