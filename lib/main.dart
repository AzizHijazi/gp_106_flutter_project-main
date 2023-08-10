import 'package:flutter/material.dart';
import 'package:longtime/prefs/pref_controller.dart';

// import 'package:longtime/screens/book%20space_payment_completed.dart';

import 'package:longtime/pages/Settings_favorite.dart';
import 'package:longtime/pages/Settings_personal_information.dart';
import 'package:longtime/pages/Settings_settings.dart';
import 'package:longtime/pages/card_booking_history.dart';
import 'package:longtime/pages/card_booking_on_going.dart';
import 'package:longtime/pages/card_booking_pending.dart';
import 'package:longtime/prefs/pref_controller.dart';
import 'package:longtime/screens/book_space_payment_completed.dart';
import 'package:longtime/screens/bottom_nav_screen.dart';
import 'package:longtime/screens/change_completed.dart';
import 'package:longtime/screens/change_password.dart';
import 'package:longtime/screens/event_payment_completed.dart';
import 'package:longtime/screens/launch_screen.dart';
import 'package:longtime/screens/login_register_tab_bar.dart';
import 'package:longtime/screens/out_boarding_screen.dart';
import 'package:longtime/screens/register_completed.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/change_password',
      routes: {
        '/launch_screen': (context) => const SplashScreen(),
        '/out_boarding_screen': (context) => const OutBoardingScreen(),
        '/login_register_screen': (context) => const LoginRegisterScreen(),
        '/bottom_nav_screen':  (context) => const BottomNavScreen(),
        '/register_completed':  (context) => const RegisterCompleted(),
        '/book_space_Payment_Completed':  (context) => const BookSpacePaymentCompleted(),
        '/event_payment_completed':  (context) => const EventPaymentCompleted(),
        '/change_completed':  (context) => const ChangeCompleted(),
        '/personal_information_screen' :  (context) => const SettingsPersonalInformation(),
        '/favorite_screen':  (context) => const SettingsFavorite(),
        '/settings_screen':  (context) =>  const MainSettings(),
        '/card_booking_pending':  (context) =>  const CardBookingPending(),
        '/card_booking_on_going':  (context) =>  const CardBookingOnGoing(),
        '/card_booking_history':  (context) =>  const CardBookingHistory(),
        '/change_password':  (context) =>  const ChangePassword(),

      },
    );
  }
}