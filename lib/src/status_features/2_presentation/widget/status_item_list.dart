import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StatusListItem extends StatefulWidget {
  const StatusListItem({
    required this.document,
    required this.firebaseAuth,
    super.key,
  });

  final DocumentSnapshot document;
  final FirebaseAuth firebaseAuth;
  @override
  State<StatusListItem> createState() => _StatusListItemState();
}

class _StatusListItemState extends State<StatusListItem> {
  @override
  Widget build(BuildContext context) {
    final data = widget.document.data()! as Map<String, dynamic>;
    if (widget.firebaseAuth.currentUser!.email != data['email']) {
      return ListTile(
        leading: const Icon(Icons.person),
        title: Text(data['email'].toString()),
        subtitle: Text(
          TimeOfDay.fromDateTime(
            DateTime.fromMillisecondsSinceEpoch(0),
          ).format(context),
        ),
      );
    }
    return Container();
  }
}
