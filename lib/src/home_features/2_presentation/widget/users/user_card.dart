import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/screen/chat_screen.dart';

class UserListItemCard extends StatelessWidget {
  const UserListItemCard({super.key, required this.document});

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    // final user = FirebaseAuth.instance.currentUser!;

// document IDs
    // List<String> docIDs = [];

    // Future getDocId() async {
    //   await FirebaseFirestore.instance.collection('users').get().then(
    //         (snap) => snap.docs.forEach((element) {
    //           print(element.reference);
    //           docIDs.add(element.reference.id);
    //         }),
    //       );
    // }

    void navigate() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(
              receiveUserName: data['email'], receiveUserId: data['uid']),
        ),
      );
    }

    return Card(
      elevation: theme.brightness == Brightness.dark ? 1 : 8,
      shadowColor: Colors.grey[300],
      color: theme.onPrimary,
      margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 19,
            foregroundImage: NetworkImage("https://picsum.photos/300/300"),
          ),
          title: MyText(
              text: data['email'],
              style: typoGraphy.textTheme.titleLarge!
                  .copyWith(color: theme.primary)),
          onTap: navigate,
          trailing:
              Icon(Ionicons.chevron_forward_outline, color: theme.primary),
        ),
      ),
    );
  }
}
