import 'package:animation_example/screens/animatedcontainer_screen.dart';
import 'package:animation_example/screens/animatedcontroller_screen.dart';
import 'package:animation_example/screens/animatedopacity_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  final List<Widget> _screen = [
    AnimatedcontainerScreen(),
    AnimatedopacityScreen(),
    AnimatedcontrollerScreen(),
  ];
  int _selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _screen[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(size: 28),
        currentIndex: _selectedScreen,
        onTap: (value) => {
          setState(() {
            _selectedScreen = value;
          }),
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.expand), label: 'Container'),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: 'Opacity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'Controller',
          ),
        ],
      ),
    );
  }
}
