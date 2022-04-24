import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepository {

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  Future<UserCredential?> googleLogin() async {

    final _googleUser  = await googleSignIn.signIn();

    if(_googleUser==null) return null;

    _user = _googleUser;

    final _googleuth = await _googleUser.authentication;

    final _credential = GoogleAuthProvider.credential(
      accessToken: _googleuth.accessToken,
      idToken: _googleuth.idToken,
    );

    UserCredential _googleUserCredential = await FirebaseAuth.instance.signInWithCredential(_credential);
    
    return _googleUserCredential;
  }

  

  Future<bool> googelLogout() async {

    try {
      await googleSignIn.signOut(); 
      return true;
    } catch (e) {
      return false;
    }

  }

  

  Future<dynamic> googleSilentLogin() async {

    final _googleUser  = await googleSignIn.signInSilently();

    if(_googleUser==null) return null;

    _user = _googleUser;

    final _googleuth = await _googleUser.authentication;

    final _credential = GoogleAuthProvider.credential(
      accessToken: _googleuth.accessToken,
      idToken: _googleuth.idToken,
    );

    UserCredential _googleUserCredential = await FirebaseAuth.instance.signInWithCredential(_credential);

    return _googleUserCredential;

  }

}