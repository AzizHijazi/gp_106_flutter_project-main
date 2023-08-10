import 'package:flutter/material.dart';
import 'package:longtime/widgets/booking_page_widget.dart';

class BookingPending extends StatefulWidget {
  const BookingPending({Key? key}) : super(key: key);

  @override
  State<BookingPending> createState() => _BookingPendingState();
}

class _BookingPendingState extends State<BookingPending> {
  @override
  Widget build(BuildContext context) {
    return BookingPageWidget(
      status: 'pending',

    );
  }
}
