import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_icon_button.dart';

typedef Button = MyIconButtons;
final List<Button> chatRoomButton = [
  Button(
    icon: Icon(
      Ionicons.mic,
      size: 22.sp,
    ),
    onPressed: () {
      //access voice message
    },
  ),
  Button(
    icon: const Icon(Ionicons.videocam),
    onPressed: () {},
  ),
  Button(
    icon: const Icon(Ionicons.call_outline),
    onPressed: () {},
  ),
  Button(
    icon: const Icon(Icons.more_vert_rounded),
    onPressed: () {},
  ),
];
