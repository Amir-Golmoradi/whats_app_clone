import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return MyText(
      text: "Let's create account for you",
      style:
          typoGraphy.textTheme.headlineMedium!.copyWith(color: theme.primary),
    );
  }
}
