import 'package:flutter/material.dart';
import 'package:longtime/widgets/build_hubs.dart';
import 'package:longtime/widgets/main_page_build_user_info.dart';
import 'package:longtime/widgets/main_page_build_workspace_categories.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildUserInfo(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Find the perfect space for you',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'avenir-heavy'),
          ),
        ),
        buildWorkspaceCategories(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Explore Around',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'avenir-heavy'),
          ),
        ),
        buildHubs(),
        const SizedBox(
          height: 30,
        ),
        Card(
          color: Colors.deepPurpleAccent,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'HOW TO START LISTING YOUR WORKSPACE.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Enjoy high occupancy rates with a continuous and guaranteed financial flow',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      'Start adding your workspace',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}