import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField(this.firstNameController, {Key? key}) : super(key: key);

  final TextEditingController firstNameController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: firstNameController,
      hintText: 'First Name',
      obsecureText: false,
      icon: const Icon(Icons.person),
      
    );
  }
}
