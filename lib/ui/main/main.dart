import 'package:flutter/material.dart';
import 'package:flutter_app/theme/Theme.dart';
import 'package:flutter_app/ui/main/tabs/first.dart';
import 'package:flutter_app/ui/main/tabs/second.dart';
import 'package:flutter_app/ui/main/tabs/third.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appMainTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  List<Widget> _tabs;
  int _currentTab = 0;

  @override
  void initState() {
    _pageController = new PageController();
    _tabs = [FirstTab(Map()), SecondTab(), MapSample()];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _tabs,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("First page"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            title: Text("First page"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Third page"),
          ),
        ],
        onTap: _navigationTapped,
        currentIndex: _currentTab,
      ),
    );
  }

  void _navigationTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    setState(() {
      this._currentTab = index;
    });
  }
}
