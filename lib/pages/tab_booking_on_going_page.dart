import 'package:flutter/material.dart';
import 'package:longtime/widgets/booking_page_widget.dart';

class BookingOnGoing extends StatefulWidget {
  const BookingOnGoing({Key? key}) : super(key: key);

  @override
  State<BookingOnGoing> createState() => _BookingOnGoingState();
}

class _BookingOnGoingState extends State<BookingOnGoing> {
  @override
  Widget build(BuildContext context) {
    return BookingPageWidget(
      status: 'confirmed',
/*
      bookStatus: 'Approved',
      orderId: 'AEMR1106231PDP',
      orderName: 'Meeting Room 1 in Ascendris - Business Bay',
      orderStartDate: 'Tue, 20 Jun 2023 09:30 AM',
      orderEndDate: 'Tue, 20 Jun 2023 11:30 AM',
      orderPrice: '270.9',
      seats: '8 Seats',
*/

    );
  }
}
