import 'package:flutter/material.dart';

class SettingsInbox extends StatelessWidget {
  const SettingsInbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 3.0,
            child: const ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/img.png'),
              ),
              title: Text(
                'Booking Declined',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('9 days ago'),
              subtitle: Text(
                'Booking #ADVFRS846GHR for meeting room 1 has been declined by the host due to unavailability in the workspace',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}


// Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Image.asset(
//         'images/logo.png', // Replace with the path to your image
//         width: 200,
//         height: 200,
//       ),
//       const SizedBox(height: 20),
//       const Text(
//         'No Notifications',
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 10),
//       const Text(
//         'You don\'t have any notifications.',
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.grey,
//         ),
//       ),
//     ],
//   ),
// ),