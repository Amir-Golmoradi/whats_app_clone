import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/gen/assets.gen.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initScreen() async {
    try {
      Timer.periodic(
        const Duration(milliseconds: 2700),
        (timer) {
          Navigator.pushReplacementNamed(context, '/auth-gate');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    initScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      body: FadeIn(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Assets.images.appLogo
                        .image(fit: BoxFit.contain, width: 40.w),
                  ),
                  MyText(
                    text: 'WhatsApp Clone',
                    style: typoGraphy.textTheme.bodyLarge!
                        .copyWith(color: theme.primary),
                  ),
                ],
              ),
            ),
            MyText(
              text: 'From',
              style: typoGraphy.textTheme.bodyLarge!
                  .copyWith(color: theme.primary, fontWeight: FontWeight.w500),
            ),
            MyText(
              text: 'meta',
              style: typoGraphy.textTheme.bodyLarge!
                  .copyWith(color: theme.primary),
            ),
            SizedBox(height: 0.15.dp),
          ],
        ),
      ),
    );
  }
}
