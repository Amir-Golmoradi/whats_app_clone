import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.icon,
    this.suffixIcon = const Icon(null),
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final Widget icon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.primary,
      cursorRadius: const Radius.circular(20),
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.brightness == Brightness.dark
                ? Colors.grey[500]!
                : Colors.grey[200]!,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.brightness == Brightness.dark
                ? Colors.grey[400]!
                : Colors.grey[200]!,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[200],
        filled: true,
      ),
    );
  }
}
