import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/users/user_list_item_widget.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;

    return StreamBuilder(
      stream: fireStore.collection('users').snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          MyText(
            text: "Loading",
            style: typoGraphy.textTheme.titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          );
        }
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => buildUserListItem(doc, context))
                .toList(),
          );
          
        }
        return const SizedBox.shrink();
      },
    );
  }
}
