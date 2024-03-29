import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';

const lightGreen = Color(0xFFC5E1A5);
const lighGray = Color(0xFFEEEEEE);

Widget chatBubble(
  DocumentSnapshot document,
  BuildContext context,
  String message,
) {
  final theme = Theme.of(context).brightness == Brightness.dark
      ? Colors.grey[500]
      : lighGray;

  final firebaseAuth = FirebaseAuth.instance;
  final data = document.data()! as Map<String, dynamic>;
  final messageColor =
      (data['senderId'] == firebaseAuth.currentUser!.uid) ? lightGreen : theme;
  return Container(
    padding: EdgeInsets.all(12.sp),
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.sp),
      ),
      color: messageColor,
    ),
    child: MyText(
      text: message,
      style: typoGraphy.textTheme.titleMedium,
    ),
  );
}
