import 'package:flutter/material.dart';



class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [

          Positioned(
            child: Container(
              height: 160.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/firstImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),

            margin: const EdgeInsets.only(top: 135),
            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Column(
                children: [


                  SizedBox(height: 10,),
                  Text('Change Password',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),

                  Text('Reset code was sent to your email. Please enter the code and create new password.',style: TextStyle(fontWeight: FontWeight.normal,),
                  ),


                  SizedBox(height: 25,),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: 'Reset Code',
                      labelText: 'Reset Code',


                    ),
                    ),

                  SizedBox(height: 25,),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      // hintText: 'New Password',
                      labelText: 'New Password',

                    ),
                  ),


                  SizedBox(height: 25,),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password'

                    ),
                  ),



                   SizedBox(height: 20,),
                   ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xff646BD9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Change Password', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'avenir-heavy',
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
