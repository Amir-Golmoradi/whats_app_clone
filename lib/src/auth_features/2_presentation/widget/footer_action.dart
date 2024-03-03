import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/sign_up_screen.dart';

class FooterAction extends StatelessWidget {
  const FooterAction({required this.widget, super.key});

  final SignUpPage widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: AppMessage.alreadyMember.tr,
          style: typoGraphy.textTheme.titleMedium!.apply(color: theme.primary),
        ),
        const SizedBox(width: 2),
        GestureDetector(
          onTap: widget.onTap,
          child: MyText(
            text: AppMessage.loginNow.tr,
            style:
                typoGraphy.textTheme.titleMedium!.apply(color: theme.primary),
          ),
        ),
      ],
    );
  }
}
