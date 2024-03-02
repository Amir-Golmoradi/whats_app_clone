// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whats_app_clone/src/chat_room_features/2_presentation/screen/chat_screen.dart';
import 'package:whats_app_clone/src/home_features/2_presentation/blocs/users-bloc/users_bloc.dart';

class UserListItem extends StatefulWidget {
  const UserListItem({
    required this.document,
    required this.firebaseAuth,
    super.key,
  });
  final DocumentSnapshot document;
  final FirebaseAuth firebaseAuth;
  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final data = widget.document.data()! as Map<String, dynamic>;
    if (widget.firebaseAuth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(13),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: theme.brightness == Brightness.dark
                    ? Colors.grey[700]!
                    : Colors.grey[500]!,
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(0, 0.6),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    BlocProvider.of<UsersBloc>(context).add(
                      DeleteUsersEvent(data['uid'].toString()),
                    );
                  },
                  borderRadius: BorderRadius.circular(18),
                  backgroundColor: Colors.redAccent[400]!,
                  foregroundColor: Colors.white,
                  icon: Ionicons.trash,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(data['email'].toString()),
              // subtitle: Text(data['status']), # CREATE A MESSAGE STATUS FOR EACH USER
              trailing: Text(TimeOfDay.now().format(context)),
              onTap: () {
                Navigator.push(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(
                    builder: (context) => ChatRoomScreen(
                      receiveUserName: data['email'].toString(),
                      receiveUserID: data['uid'].toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
