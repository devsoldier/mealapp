import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
      'actions': ElevatedButton
    },
    {'page': FavoritesScreen(), 'title': 'favorites'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0, is the default value aka first tab
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: Drawer(
          child: Text('The Drawer'),
        ),
        body: _pages[_selectedPageIndex]
            ['page'], //display content base on index
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage, //changes index
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex, //changes active tab base on index
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Favorites')
            ]),
      ),
    );
  }
}
