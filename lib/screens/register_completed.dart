import 'package:flutter/material.dart';

class RegisterCompleted extends StatelessWidget {
  const RegisterCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
            const SizedBox(height: 10),
            const Text(
              'Welcome to CoSpace!',
              style: TextStyle(fontSize: 20, fontFamily: 'avenir-heavy'),
            ),
            const SizedBox(height: 17),
            Text(
              'You can now complete your profile or go to your home page to find a centre, make a booking or use any of the features of CoSpace.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: ElevatedButton(
                onPressed: () => _goToLoginPage(context),
                style: ElevatedButton.styleFrom(

                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3.0,

                  backgroundColor: const Color(0xffF0F0F0),

                  minimumSize: const Size(double.infinity, 50),

                ),







                child: const Text(
                  'Go Home Page',
                  style: TextStyle(color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

            ),

            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => _goToLoginPage(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3.0,
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xff646BD9),
              ),
              child: const Text(
                'Complete My Profile',
                style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  void _goToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login_register_screen');
  }
}