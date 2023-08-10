import 'package:flutter/material.dart';
import 'package:longtime/pages/Booking_Review.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({super.key});

  @override
  _MyDateTimePickerState createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  String _selectedRange = '';

  Color _button1Color = Colors.transparent;
  Color _button2Color = Colors.transparent;
  Color _button3Color = Colors.transparent;
  Color _button4Color = Colors.transparent;
  Color _button5Color = Colors.transparent;

  bool _isButton1Clicked = false;
  bool _isButton2Clicked = false;
  bool _isButton3Clicked = false;
  bool _isButton4Clicked = false;
  bool _isButton5Clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Date and Time'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: SfDateRangePicker(
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      final PickerDateRange range = args.value;
                      setState(() {
                        _selectedRange =
                            '${range.startDate.toString().split(' ')[0]} - ${range.endDate.toString().split(' ')[0]}';
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Text('Selected Range: $_selectedRange'),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                const Text('Checkin'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isButton1Clicked = !_isButton1Clicked;
                          _button1Color = _isButton1Clicked
                              ? Colors.purpleAccent
                              : Colors.transparent;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _button1Color,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('4:00',
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isButton2Clicked = !_isButton2Clicked;
                          _button2Color = _isButton2Clicked
                              ? Colors.purpleAccent
                              : Colors.transparent;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _button2Color,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('4:30',
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isButton3Clicked = !_isButton3Clicked;
                          _button3Color = _isButton3Clicked
                              ? Colors.purpleAccent
                              : Colors.transparent;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _button3Color,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('5:00',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text('Checkout'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isButton4Clicked = !_isButton4Clicked;
                          _button4Color = _isButton4Clicked
                              ? Colors.purpleAccent
                              : Colors.transparent;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _button4Color,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('5:00',
                          style: TextStyle(color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isButton5Clicked = !_isButton5Clicked;
                          _button5Color = _isButton5Clicked
                              ? Colors.purpleAccent
                              : Colors.transparent;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _button5Color,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('6:00',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingReview()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: const Color(0xff646BD9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Review Booking',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
