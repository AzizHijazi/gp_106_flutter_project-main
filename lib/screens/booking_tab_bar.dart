import 'package:flutter/material.dart';
import 'package:longtime/pages/tab_booking_history.dart';
import 'package:longtime/pages/tab_booking_on_going_page.dart';
import 'package:longtime/pages/tab_booking_pending_page.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        title: const Text('Bookings',style: TextStyle(color: Colors.black87,)),),
      body:  Column(children: [
        TabBar(
          controller: _tabController,

          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Ongoing'),
            Tab(text: 'History'),
          ],
          labelColor: const Color(0xff646BD9),
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              BookingPending(),
              BookingOnGoing(),
              BookingHistory(),
            ],
          ),
        ),
      ]),
    );
  }
}