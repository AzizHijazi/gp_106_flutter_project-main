import 'package:flutter/material.dart';

class EventPaymentCompleted extends StatelessWidget {
  const EventPaymentCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 150,),
            Image.asset('images/img.png'),
            const SizedBox(height: 50,),
            const Text('You’re going!',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17),),
            const SizedBox(height: 20,),

            Text('This event has been added to your upcoming feed and entry passess will be available from Your Profile.',
              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.grey.shade500),),


            const SizedBox(height: 100,),
            ElevatedButton(onPressed: ()=>_performLogin(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),

                ),
                elevation: 5,
                minimumSize: const Size(double.infinity,50),
                backgroundColor: Colors.deepPurple.shade500,
              ), child: const Text('Go Home Page',style: TextStyle(fontWeight:
            FontWeight.normal,fontSize: 15,color: Colors.white),),
            ),
          ],
        ),

      ),

    );
  }
  void _performLogin(){

  }
}