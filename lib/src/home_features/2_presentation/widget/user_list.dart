// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/widget/user_list_item.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    final fireStore = FirebaseFirestore.instance;

    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>(
                (doc) => UserListItem(
                  document: doc,
                  firebaseAuth: firebaseAuth,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
