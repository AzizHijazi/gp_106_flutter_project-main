import 'package:flutter/material.dart';

class ChangeCompleted extends StatelessWidget {
  const ChangeCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/img.png'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Congrats!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'You have successfully changed your password. Please use the new password when logging in.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _goToHomeScreen(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3.0,
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xff646BD9),
                ),
                child: const Text(
                  'Log In Now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login_register_screen');
  }
}