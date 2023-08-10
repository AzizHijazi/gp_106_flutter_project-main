import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/models/User.dart';
import 'package:longtime/widgets/email_pass_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _userTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    _userTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _userTextController.dispose();
    _confirmPasswordTextController.dispose();
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
              'Welcome to coSpace!',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'avenir-heavy',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            EmailPasswordWidget(
                controller: _userTextController,
                labelText: 'Username',
                obscureText: false,
                textInputType: TextInputType.name),
            const SizedBox(
              height: 16,
            ),
            EmailPasswordWidget(
                controller: _emailTextController,
                labelText: 'Email',
                obscureText: false,
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            EmailPasswordWidget(
                controller: _passwordTextController,
                labelText: 'Password',
                showIcon: true,
                textInputType: TextInputType.visiblePassword),

            const SizedBox(
              height: 16,
            ),
            EmailPasswordWidget(
              controller: _confirmPasswordTextController,
              labelText: 'Confirm Password',
              showIcon: true,
              textInputType: TextInputType.visiblePassword,
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: ElevatedButton(
                onPressed: () => _performRegister(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xff646BD9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'avenir-heavy',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'or register with social account',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'avenir-heavy',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _performRegister(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      backgroundColor: const Color(0xffF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.lightBlueAccent,
                    ),
                    label: const Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _performRegister(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      backgroundColor: const Color(0xffF0F0F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.lightBlueAccent,
                    ),
                    label: const Text(
                      'Twitter',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'avenir-heavy',
                    fontSize: 14,
                    color: Color(0xff787979),
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: 'By clicking Register you are agreeing to the ',
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' and the ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }


  bool _checkData() {
    if (
    _userTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty && _confirmPasswordTextController.text.isNotEmpty ) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter required data'),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.horizontal,
        elevation: 4  ,
      ),
    );
    return false;
  }

  Future<void> _register() async {
    bool status = await ApiController().register(context, user: user);
  }

  User get user{
    User user = User();
    user.name = _userTextController.text;
    user.email = _emailTextController.text;
    user.password = _passwordTextController.text;
    user.passwordConfirmation = _confirmPasswordTextController.text;
    return user;
  }

}