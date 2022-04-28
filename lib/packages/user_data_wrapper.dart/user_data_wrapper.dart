import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataWrapper extends StatelessWidget {
  final Widget child;
  final UserCredential user;

  static late UserCredential currentUser;

  UserDataWrapper({
    Key? key,
    required this.user,
    required this.child,
  }) : super(key: key) {
    currentUser = user;
  }

  @override
  Widget build(BuildContext context) => child;
  
  static UserData of({required BuildContext context}) {
    return UserData(currentUser: currentUser);
  }

}

@immutable
class UserData {
  
  // * UserCredential
  final UserCredential currentUser;

  const UserData({
    required this.currentUser,
  });
}