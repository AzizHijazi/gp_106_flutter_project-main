import 'package:flutter/material.dart';
import 'package:longtime/models/bn_item.dart';
import 'package:longtime/pages/Settings_inbox.dart';
import 'package:longtime/pages/Settings_settings.dart';
import 'package:longtime/pages/btn_home_page.dart';
import 'package:longtime/pages/btn_main_page.dart';
import 'package:longtime/screens/booking_tab_bar.dart';
import 'package:longtime/screens/settings_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<BnItem> _items = <BnItem>[
    const BnItem('Explore',HomeScreen()),
    const BnItem('Booking',BookingScreen()),
    const BnItem('Home',MainPage()),
    const BnItem('Notifications',SettingsInbox()),
    const BnItem('Settings',SettingsScreen()),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _items[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          size: 27,
        ),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff646BD9),
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.explore_rounded,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
              label: ''),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail_outlined,
              ),
              activeIcon: Icon(
                Icons.mail,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ''),
        ],
      ),
    );
  }
}

