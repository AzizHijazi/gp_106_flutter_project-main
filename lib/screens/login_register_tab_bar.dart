import 'package:flutter/material.dart';
import 'package:longtime/pages/tab_login_page.dart';
import 'package:longtime/pages/tab_register_page.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'LOG IN'),
                      Tab(text: 'REGISTER'),
                    ],
                    labelColor: const Color(0xff646BD9),
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(fontSize: 13),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xff646BD9),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      LoginScreen(),
                      RegisterScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}