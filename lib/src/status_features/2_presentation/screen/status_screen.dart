import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/status_features/2_presentation/widget/status_item_list.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final firebaseAuth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: AppMessage.status.tr,
                  style: typoGraphy.textTheme.headlineMedium!.copyWith(
                    color: theme.primary,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.more_vert,
                  color: theme.primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.sp),
          currentUserStatus(firebaseAuth, theme),
          SizedBox(height: 18.sp),
          Container(
            margin: EdgeInsets.only(left: 21.sp),
            alignment: Alignment.centerLeft,
            child: MyText(
              text:  AppMessage.recentUpdate.tr ,
              style: typoGraphy.textTheme.titleMedium!.copyWith(
                color: theme.inversePrimary,
              ),
            ),
          ),
          StreamBuilder(
            stream: firestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView(
                    children: snapshot.data!.docs
                        .map<Widget>(
                          (doc) => StatusListItem(
                            document: doc,
                            firebaseAuth: firebaseAuth,
                          ),
                        )
                        .toList(),
                  ),
                );
              }
              return const Text('');
            },
          ),
        ],
      ),
    );
  }

  ListTile currentUserStatus(FirebaseAuth firebaseAuth, ColorScheme theme) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 27,
        foregroundImage: NetworkImage('https://picsum.photos/200/300'),
      ),
      title: MyText(
        text: firebaseAuth.currentUser!.email.toString(),
        style: typoGraphy.textTheme.titleMedium!.copyWith(
          color: theme.primary,
        ),
      ),
      subtitle: MyText(
        text: AppMessage.statusTap.tr,
        style: typoGraphy.textTheme.titleSmall!.copyWith(
          color: theme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
