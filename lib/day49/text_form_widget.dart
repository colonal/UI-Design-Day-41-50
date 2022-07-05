import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  const TextFormWidget(
      {required this.controller,
      required this.text,
      required this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.onChanged,
      this.hint,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            height: 1.5,
            letterSpacing: 1.5,
            fontSize: 20,
          ),
        ),
        Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent.withOpacity(0.2),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 20,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(
                fontSize: 20,
              ),
              suffixIcon: widget.suffixIcon,
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
