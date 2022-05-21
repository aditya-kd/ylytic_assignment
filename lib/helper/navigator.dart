import 'package:flutter/material.dart';
import '../screen/homescreen.dart';
import '../screen/secondscreen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;
  final PageController _controller = PageController();
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTap(int index) {
    _controller.animateToPage(index,
        duration: const Duration(seconds: 1), curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      const CardList(),
      const SecondScreen(),
    ];
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
        home: SafeArea(
          child: Scaffold(
            body: PageView(
              controller: _controller,
              onPageChanged: _onPageChanged,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: _onItemTap,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black54,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
              ],
            ),
          ),
        ));
  }
}
