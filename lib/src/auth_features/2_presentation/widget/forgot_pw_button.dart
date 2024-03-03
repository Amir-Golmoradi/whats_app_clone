import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({required this.theme, super.key});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/forgot-pw'),
        child: MyText(
          text: AppMessage.forgotPassword.tr,
          style: typoGraphy.textTheme.titleMedium!.apply(color: theme.primary),
        ),
      ),
    );
  }
}
