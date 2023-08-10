import 'package:flutter/material.dart';
import 'package:longtime/prefs/pref_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward().whenComplete(() {
      String route = SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name) ?? false ? "/bottom_nav_screen" : "/login_register_screen";
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const Image(
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const Text(
                  "CoSpace",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'avenir-heavy',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "CoSpace",
              style:
              TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'avenir-heavy',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}