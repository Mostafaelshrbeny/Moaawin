import 'package:flutter/material.dart';
import 'package:handyzone/Locale/locales.dart';
import 'package:handyzone/Others/Bookings/bookings.dart';
import 'package:handyzone/Others/Chat/chat.dart';
import 'package:handyzone/Others/HomePage/home_page.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePageUI(),
    Bookings(),
    Chat(),
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/Icons/home.png')),
        label: locale!.home,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/Icons/bookings.png')),
        label: locale.booking,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/Icons/chats.png')),
        label: locale.chats,
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
