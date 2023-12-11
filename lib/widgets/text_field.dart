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
  final int? maxLength;
  final String? error;
  final String? label;

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
    this.maxLength,
    this.error,
    this.label
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
      maxLength: widget.maxLength,
      decoration: widget.decoration.copyWith(
        label: Text(widget.label.toString()),
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () => widget.controller.clear(),
          icon: const Icon(Icons.clear),
        ),
        error: Text(widget.error.toString(),style: const TextStyle(color: Colors.red),),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
