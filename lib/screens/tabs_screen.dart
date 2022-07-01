import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screnn.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const FavoritesScreen(), 'title': 'Your Favorite'}
  ];
  int _selectedPageIndex = 0;
  void setPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //The below code is to draow Tabs at the Top
    //   return DefaultTabController(
    //       length: 2,
    //       initialIndex: 0,
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text('Meals'),
    //           bottom: const TabBar(tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             )
    //           ]),
    //         ),
    //         body: const TabBarView(
    //             children: [CategoriesScreen(), FavoritesScreen()]),
    //       ));
    // }

    //The below code is to draw Tabs at the Boootm
    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: const MainDrawe(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: setPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.category),
                label: 'Categories'),
            const BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.star),
                label: 'Favorites')
          ]),
    );
  }
}
