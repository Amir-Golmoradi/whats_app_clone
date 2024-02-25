import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';

class HeaderActionButtons extends StatelessWidget {
  const HeaderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final FirebaseAuthService authService = FirebaseAuthService();
    return Wrap(
      children: [
        MyIconButtons(
          icon: Icon(Icons.camera_alt_outlined, color: theme.primary),
          onPressed: () {},
        ),
        MyIconButtons(
          icon: Icon(Icons.search_rounded, color: theme.primary),
          onPressed: () {},
        ),
        MyIconButtons(
          icon: Icon(Icons.more_vert_rounded, color: theme.primary),
          onPressed: () {},
        )
      ],
    );
  }
}
