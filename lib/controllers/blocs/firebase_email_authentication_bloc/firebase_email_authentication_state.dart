part of 'firebase_email_authentication_bloc.dart';

abstract class FirebaseEmailAuthenticationState extends Equatable {
  const FirebaseEmailAuthenticationState();
  
  @override
  List<Object> get props => [];
}


// * Initial State
class FirebaseEmailAuthenticationInitial extends FirebaseEmailAuthenticationState {}


// * Loading State
class FirebaseEmailAuthenticationLoading extends FirebaseEmailAuthenticationState {}


// * Registering State
class FirebaseEmailAuthenticationRegistering extends FirebaseEmailAuthenticationState {}


// * Registered State
class FirebaseEmailAuthenticationRegistered extends FirebaseEmailAuthenticationState {}


// * Logging In State
class FirebaseEmailAuthenticationLoggingIn extends FirebaseEmailAuthenticationState {}


// * Logged In State
class FirebaseEmailAuthenticationLoggedIn extends FirebaseEmailAuthenticationState {

  // final LocalUserData localUserData;
  final UserCredential userCredential;

  const FirebaseEmailAuthenticationLoggedIn({
    // required this.localUserData,
    required this.userCredential,
  });
  
  @override
  List<Object> get props => [userCredential];
  // List<Object> get props => [localUserData, userCredential];
}


// * Logging Out State
class FirebaseEmailAuthenticationLoggingOut extends FirebaseEmailAuthenticationState {}


// * Logged Out State
class FirebaseEmailAuthenticationLoggedOut extends FirebaseEmailAuthenticationState {}


// * Error State
class FirebaseEmailAuthenticationError extends FirebaseEmailAuthenticationState {

  final String errorMessage;

  const FirebaseEmailAuthenticationError({
    required this.errorMessage,
  });
  
  @override
  List<Object> get props => [errorMessage];
}