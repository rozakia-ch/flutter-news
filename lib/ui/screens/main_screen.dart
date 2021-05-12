import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/ui/screens/navbar_screens/home_screen.dart';
import 'package:flutter_news/ui/screens/navbar_screens/search_screen.dart';
import 'package:flutter_news/ui/screens/navbar_screens/sources_screen.dart';
import 'package:flutter_news/ui/styles/style.dart' as Style;

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    SourcesScreen(),
    SearchScreen(),
  ];
  static const List<String> _title = ["News App", "Sources", "Search"];
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // Set the default textScaleFactor to 1.0 for
      // the whole subtree.
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            _title.elementAt(_selectedIndex),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              iconSize: 20,
              unselectedItemColor: Style.Colors.grey,
              unselectedFontSize: 9.5,
              selectedFontSize: 9.5,
              type: BottomNavigationBarType.fixed,
              fixedColor: Style.Colors.mainColor,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(EvaIcons.homeOutline),
                  activeIcon: Icon(EvaIcons.home),
                ),
                BottomNavigationBarItem(
                  label: "Sources",
                  icon: Icon(EvaIcons.gridOutline),
                  activeIcon: Icon(EvaIcons.grid),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(EvaIcons.searchOutline),
                  activeIcon: Icon(EvaIcons.search),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
