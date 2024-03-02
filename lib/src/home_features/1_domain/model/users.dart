// ignore_for_file: sort_constructors_first

class UserModel {
  // named constructor
  UserModel({
   this.uid = '',
   this.username = '',
   this.desc = '',
   this.imageUrl = '',
  });

  final String uid;
  final String username;
  final String desc;
  final String imageUrl;

  // copy with
  UserModel copyWith({
    String? uid,
    String? username,
    String? desc,
    String? imageUrl,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        username: username ?? this.username,
        desc: desc ?? this.desc,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        uid: map['uid'] as String,
        username: map['username'] as String,
        desc: map['desc'] as String,
        imageUrl: map['imageUrl'] as String,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'username': username,
        'desc': desc,
        'imageUrl': imageUrl,
  };
}
