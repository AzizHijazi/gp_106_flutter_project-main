import 'package:flutter/material.dart';
import 'package:longtime/models/OutBoardingPageModel.dart';
import 'package:longtime/widgets/out_boarding_page_widget.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;
  final List<OutBoardingPageModel> _outBoardingPages = [
    OutBoardingPageModel(
      title: 'Book a Room and Workspace On-Demand',
      image: 'images/out_boarding/imageOne.png',
    ),
    OutBoardingPageModel(
      title: 'Discover and Attend all Public Events in the City',
      image: 'images/out_boarding/imageTwo.png',
    ),
    OutBoardingPageModel(
      title: 'Connect with The Community and Find New Customers',
      image: 'images/out_boarding/imageThird.png',
    ),
    OutBoardingPageModel(
      title: 'Make Fast and Easy Payments through The App',
      image: 'images/out_boarding/imageForth.png',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: _outBoardingPages.length,
              itemBuilder: (context, index) {
                return OutBoardingPage(
                  title: _outBoardingPages[index].title,
                  image: _outBoardingPages[index].image,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _outBoardingPages.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutQuart,
                    width: _currentPage == i ? 16 : 8,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _currentPage == i ? const Color(0xff646BD9) : const Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            ],
          ),


          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: _currentPage == 3 ? Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login_register_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xff646BD9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Start',style: TextStyle(fontSize: 18),
                      ),
                    )
                ),
              ],
            ) : ElevatedButton(
              onPressed: () {
                setState(() {
                  _pageController.animateToPage(3, duration: const Duration(seconds: 2), curve: Curves.easeOutExpo);
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(155, 50),
                backgroundColor: const Color(0xff646BD9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'SKIP',
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}