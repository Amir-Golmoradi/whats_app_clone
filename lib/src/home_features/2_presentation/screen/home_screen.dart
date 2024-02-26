import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/users/add_user_button.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/users/user_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: const UserListWidget(),
      floatingActionButton: AddChatButton(theme: theme),
    );
  }
}
