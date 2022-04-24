import 'package:firebase_auth/firebase_auth.dart' as auth; // * use as keyword to resolve name conflicts
import 'package:flutter/cupertino.dart';

import '../../models/user.dart';

class FirebaseAuthenticationRepository {

  final auth.FirebaseAuth _firebaseAuth;

   FirebaseAuthenticationRepository({
     auth.FirebaseAuth? firebaseAuth
   }) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;


   Future<User> firebaseEmailRegistration ({
     required String email,
     required String firstName,
     required String lastName,
     required String password,
     required String confirmPassword,
   }) async {

    //  await Future.delayed(const Duration(seconds: 1));

     return User(
      email: 'dummyEmail@dummy.com',
      displayName: 'displayName',
      id: 'id',
     );

   }

  // * listen to changes to the user
   Stream<auth.User?> get user => _firebaseAuth.userChanges();


}