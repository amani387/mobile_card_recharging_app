import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final Function(String)? onChanged;
  final Function()? onTap;
  final InputDecoration decoration;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.onChanged,
    this.onTap,
    this.decoration = const InputDecoration(),
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      maxLength: 13,
      
      decoration: widget.decoration.copyWith(
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

// Example usage:
// CustomTextField(
//   hintText: 'Enter your text',
//   controller: myController,
//   onChanged: (value) {
//     // Handle text changes
//   },
//   onTap: () {
//     // Handle tap
//   },
//   // Add other properties as needed
// )
