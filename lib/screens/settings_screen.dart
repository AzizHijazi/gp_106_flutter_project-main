import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/widgets/settings_list_title_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                height: 170,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'images/profile.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Column(
          children: [
            ListTile(
              title: Text(
                'Account settings',
                style: TextStyle(
                    fontFamily: 'tajawal', fontSize: 19, color: Colors.grey),
              ),
            ),
            SettingListTileWidget(
              destinationRoute: '/personal_information_screen',
              listTileName: 'Personal information',
            ),
            SettingListTileWidget(
              destinationRoute: '/',
              listTileName: 'Payment methods',
            ),
            SettingListTileWidget(
              destinationRoute: '/favorite_screen',
              listTileName: 'Favorite',
            ),
            ListTile(
              title: Text(
                'Application Settings',
                style:
                TextStyle(fontFamily: 'avenir-heavy', color: Colors.grey),
              ),
            ),
            SettingListTileWidget(
              destinationRoute: '/settings_screen',
              listTileName: 'Settings',
            ),
            SettingListTileWidget(
              destinationRoute: '/',
              listTileName: 'Help center',
            ),
            SettingListTileWidget(
              destinationRoute: '/',
              listTileName: 'Feedback',
            ),
            SettingListTileWidget(
              destinationRoute: '/',
              listTileName: 'Terms and conditions',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: ElevatedButton(
            onPressed: () async{
              bool result = await ApiController().logout();
              if (result) {
                Navigator.pushReplacementNamed(context, '/login_register_screen');
              }
              },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xffE0E0E0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Log out',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(height: 40, child: Image.asset('images/logo.png')),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tech Hub',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
