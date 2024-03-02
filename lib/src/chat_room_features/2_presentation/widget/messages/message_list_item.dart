import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/widget/chat_bubble.dart';

// ignore: public_member_api_docs
Widget messageListItem(DocumentSnapshot document, BuildContext context) {
  final firebaseAuth = FirebaseAuth.instance;

  final data = document.data()! as Map<String, dynamic>;

// message must be on the right ONLY if sender is current user;

  final messageAlignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
      ? Alignment.centerRight
      : Alignment.centerLeft;
  return Container(
    alignment: messageAlignment,
    padding: EdgeInsets.all(12.sp),
    child: Column(
      crossAxisAlignment: (data['senderId'] == firebaseAuth.currentUser!.uid)
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisAlignment: (data['senderId'] == firebaseAuth.currentUser!.uid)
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        MyText(
          text: data['senderEmail'].toString(),
          style: GoogleFonts.robotoSlab(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(height: 0.14.dp),
        chatBubble(document, context, data['message'].toString()),
      ],
    ),
  );
}
