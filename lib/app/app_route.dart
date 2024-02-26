import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/app/tab_route_item.dart';
import 'package:whats_app_clone/app/widget/header_button.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/core/utils/tab_screen.dart';

const int tabLength = 4;
const String title = "WhatsApp";

class TabRoute extends StatelessWidget {
  const TabRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = typoGraphy.textTheme;

    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Adaptive.dp(0.56),
          title: Container(
            margin: EdgeInsets.only(bottom: 0.4.dp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: title,
                  style:
                      textTheme.headlineMedium!.copyWith(color: theme.primary),
                ),
                const HeaderActionButtons(),
              ],
            ),
          ),
          bottom: tabRouteItem(theme, textTheme),
        ),
        body: TabBarView(children: tabScreen),
      ),
    );
  }
}
