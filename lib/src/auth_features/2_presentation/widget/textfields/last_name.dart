import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';

class LastNameField extends StatelessWidget {
  const LastNameField(this.lastNameController, {Key? key}) : super(key: key);

  final TextEditingController lastNameController;
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: lastNameController,
      hintText: 'Last Name',
      obsecureText: false,
      icon: const Icon(Icons.person),
      
    );
  }
}
