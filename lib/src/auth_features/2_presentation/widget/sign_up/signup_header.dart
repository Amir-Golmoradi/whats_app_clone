import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return MyText(
      text: AppMessage.signupTitle.tr,
      style:
          typoGraphy.textTheme.headlineMedium!.copyWith(color: theme.primary),
    );
  }
}
