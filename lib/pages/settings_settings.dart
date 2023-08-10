import 'package:flutter/material.dart';

class MainSettings extends StatelessWidget {
  const MainSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showBottomSheet(BuildContext context, String title, List<String> options) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      options[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteAccount(BuildContext context) {
    // TODO: Handle account deletion
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Preferences',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text('Language'),
              trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.deepPurpleAccent),

              onTap: () {
                _showBottomSheet(context, 'Select Language', ['English', 'Arabic']);
              },
            ),
            ListTile(
              title: const Text('Currency'),
              trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.deepPurpleAccent),
              onTap: () {
                _showBottomSheet(context, 'Select Currency', ['USD', 'ILS']);
              },
            ),
            ListTile(
              title: const Text('Delete Account'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Account Deletion'),
                      content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('Delete',style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            _deleteAccount(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
