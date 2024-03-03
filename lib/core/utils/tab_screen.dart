import 'package:flutter/material.dart';
import 'package:whats_app_clone/app/app_route.dart';
import 'package:whats_app_clone/src/audio_call_features/2_presentation/screen/audio_call_screen.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/screen/forget_password.dart';
import 'package:whats_app_clone/src/camera_feature/camera_screen.dart';
import 'package:whats_app_clone/src/community_features/2_presentation/screen/community_screen.dart';
import 'package:whats_app_clone/src/contacts_features/presentation/screen/contact_screen.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/screen/home_screen.dart';
import 'package:whats_app_clone/src/status_features/2_presentation/screen/status_screen.dart';

typedef AppRoute = Map<String, Widget Function(BuildContext)>;

List<Widget> tabScreen = [
  const CommunityScreen(),
  const HomeScreen(),
  const StatusScreen(),
  const AudioCallScreen(),
];

const Widget initRoute = TabRoute();

final AppRoute appRoute = {
  '/main': (context) => const TabRoute(),
  '/home': (context) => const HomeScreen(),
  '/status': (context) => const StatusScreen(),
  '/calls': (context) => const AudioCallScreen(),
  '/contact': (context) => const ContactScreen(),
  '/camera': (context) => const TakePictureScreen(),
  '/forgot-pw': (context) => const ForgotPassword(),
  '/community': (context) => const CommunityScreen(),
};
