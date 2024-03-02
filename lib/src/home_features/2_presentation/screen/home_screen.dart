import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/add_chat_button.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/user_list.dart';

// Chat Tab Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body:const UserList(),
      floatingActionButton: AddChatButton(theme: theme),
    );
  }
}
