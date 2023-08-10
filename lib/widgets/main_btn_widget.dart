import 'package:flutter/material.dart';


class BasicMainButtonWidget extends StatefulWidget {

  final VoidCallback callback;
  final String label;

  const BasicMainButtonWidget({
    Key? key,
    required this.callback,
    required this.label,
  }) : super(key: key);

  @override
  _BasicMainButtonWidgetState createState() => _BasicMainButtonWidgetState();
}

class _BasicMainButtonWidgetState extends State<BasicMainButtonWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: widget.callback,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(
          double.infinity,
          50,
        ),
        backgroundColor: const Color(0xff646BD9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        widget.label,
      ),
    );
  }
}