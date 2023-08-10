import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/prefs/pref_controller.dart';
import 'package:longtime/widgets/email_pass_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:longtime/screens/bottom_nav_screen.dart';
import 'package:longtime/widgets/email_pass_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'avenir-heavy',
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
              ),
              child: EmailPasswordWidget(
                  controller: _emailTextController,
                  labelText: 'Email',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress),
            ),
            const SizedBox(
              height: 24,
            ),
            EmailPasswordWidget(
                controller: _passwordTextController,
                labelText: 'Password',
                textInputType: TextInputType.visiblePassword),
            const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'avenir-heavy',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  _performLogin();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xff646BD9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'avenir-heavy',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: const Color(0xffd7d7d9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Login as a Visitor',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'avenir-heavy',
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Enter Required Data!'),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      showCloseIcon: true,
      dismissDirection: DismissDirection.horizontal,
    ));
    return false;
  }

  void _login() async {
    bool result = await ApiController()
        .login(context, email: _emailTextController.text,
        password: _passwordTextController.text);
    if (result) {
      Navigator.pushReplacementNamed(context, '/bottom_nav_screen');
    }
  }
}
