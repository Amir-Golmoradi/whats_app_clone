import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';

TabBar tabRouteItem(ColorScheme theme, TextTheme textTheme) {
  return TabBar(
    tabs: [
      Tab(
        child: Icon(Ionicons.people, color: theme.primary),
      ),
      Tab(
        child: MyText(
            text: "Chats",
            style: textTheme.titleLarge!.copyWith(color: theme.primary)),
      ),
      Tab(
        child: MyText(
            text: "Updates",
            style: textTheme.titleLarge!.copyWith(color: theme.primary)),
      ),
      Tab(
        child: MyText(
            text: "Calls",
            style: textTheme.titleLarge!.copyWith(color: theme.primary)),
      ),
    ],
  );
}
