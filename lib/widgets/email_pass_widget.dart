import 'package:flutter/material.dart';

class EmailPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  bool? showIcon = false;
  final TextInputType textInputType;

  EmailPasswordWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.textInputType,
    this.obscureText = true, this.showIcon,
  }) : super(key: key);

  @override
  _EmailPasswordWidgetState createState() => _EmailPasswordWidgetState();
}

class _EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.textInputType,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.showIcon ?? false
            ? IconButton(
          onPressed: () {
            setState(() => _obscureText = !_obscureText);
          },
          icon: Icon(_obscureText
              ? Icons.visibility
              : Icons.visibility_off),
        )
            : null,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
      ),
    );
  }
}