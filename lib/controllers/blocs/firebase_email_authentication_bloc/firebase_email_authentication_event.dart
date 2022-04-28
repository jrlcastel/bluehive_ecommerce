part of 'firebase_email_authentication_bloc.dart';

abstract class FirebaseEmailAuthenticationEvent extends Equatable {
  const FirebaseEmailAuthenticationEvent();

  @override
  List<Object> get props => [];
}


// * Email Login Event
class LoginFirebaseEmail extends FirebaseEmailAuthenticationEvent {

  final String email;
  final String password;

  const LoginFirebaseEmail({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

}


// * Email Registration Event
class RegisterFirebaseEmail extends FirebaseEmailAuthenticationEvent {

  final String email;
  final String displayName;
  final String password;
  final String confirmPassword;

  const RegisterFirebaseEmail({
    required this.email,
    required this.displayName,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, displayName, password, confirmPassword];

}


// * Email Logout Event
class LogoutFirebaseEmail extends FirebaseEmailAuthenticationEvent {}