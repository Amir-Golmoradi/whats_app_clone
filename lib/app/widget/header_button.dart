// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/buttons.dart';

class HeaderActionButtons extends StatefulWidget {
  const HeaderActionButtons({super.key});

  @override
  State<HeaderActionButtons> createState() => _HeaderActionButtonsState();
}

class _HeaderActionButtonsState extends State<HeaderActionButtons> {
  Future<void> updateLocale(String localCode) async {
    await Get.updateLocale(Locale(localCode));
    final shared = await SharedPreferences.getInstance();
    await shared.setString('app_langCode', localCode);
  }

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
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    MyText(text: AppMessage.logout.tr),
                    Divider(color: theme.background),
                    TextButton(
                      onPressed: () {
                        updateLocale('en');
                        Navigator.pop(context);
                      },
                      child: const MyText(text: 'English'),
                    ),
                    Divider(color: theme.background),
                    TextButton(
                      onPressed: () {
                        updateLocale('fa');
                        Navigator.pop(context);
                      },
                      child: const MyText(text: 'Persian'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
