import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthenticationRepository {

  final FirebaseAuth firebaseAuth;

   FirebaseAuthenticationRepository({
     required this.firebaseAuth
   });
   

  // * Login
  Future<UserCredential> emailLogin ({
    required String email,
    required String password,
  }) async => await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  // }) async => await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).asStream();


  // * Logout
  Future emailLogout() async => await firebaseAuth.signOut();


  // * Registration
  Future<UserCredential> firebaseEmailRegistration ({ 
    required String email,  
    required String displayName,
    required String password,
    required String confirmPassword,
  }) async {  

    // firebaseAuth

    try {
      UserCredential _userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return _userCredential;
    }
    catch(e) {
      rethrow;
    }
    
  }

}