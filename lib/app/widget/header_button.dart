// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/buttons.dart';

class HeaderActionButtons extends StatelessWidget {
  const HeaderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final authService = FirebaseAuthService();
    return Wrap(
      children: [
        MyIconButtons(
          icon: Icon(Icons.camera_alt_outlined, color: theme.primary),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/camera');
          },
        ),
        MyIconButtons(
          icon: Icon(Icons.search_rounded, color: theme.primary),
          onPressed: () {},
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem<Button>(
              onTap: authService.signOut,
              child: const Text('LogOut'),
            ),
          ],
        ),
      ],
    );
  }
}
