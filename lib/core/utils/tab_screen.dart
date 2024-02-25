import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/app_route.dart';
import 'package:whats_app_clone/src/call_features/2_presentation/screen/call_screen.dart';
import 'package:whats_app_clone/src/community_features/2_presentation/screen/community_screen.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/screen/home_screen.dart';
import 'package:whats_app_clone/src/status_features/2_presentation/screen/status_screen.dart';

typedef AppRoute = Map<String, Widget Function(BuildContext)>;

List<Widget> tabScreen = [
  const CommunityScreen(),
  const HomeScreen(),
  const StatusScreen(),
  const CallsScreen()
];

const Widget initRoute = TabRoute();

final AppRoute appRoute = {
  '/main': (context) => const TabRoute(),
  '/community': (context) => const CommunityScreen(),
  '/home': (context) => const HomeScreen(),
  '/status': (context) => const StatusScreen(),
  '/calls': (context) => const CallsScreen(),
  // '/sign-in': (context) => LoginPage(onTap: () {}),
  // '/sign-up': (context) => SignUpPage(onTap: () {}),
};
