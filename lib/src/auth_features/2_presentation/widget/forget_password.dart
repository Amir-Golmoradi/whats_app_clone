import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: MyText(
          text: "Forget Password?",
          style: typoGraphy.textTheme.titleMedium!.apply(color: theme.primary),
        ),
      ),
    );
  }
}