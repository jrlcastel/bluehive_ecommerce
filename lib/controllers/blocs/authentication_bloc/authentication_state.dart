part of 'authentication_bloc.dart';

enum AuthenticationType {
  google,
  email,
}

abstract class AuthenticationState extends Equatable {
  
  const AuthenticationState();
  
  @override
  List<Object?> get props => [];

}



// * Initial State
class AuthenticationInitial extends AuthenticationState {}


// * Loading State - general loading
class AuthenticationLoading extends AuthenticationState {}


// * Registering State
class AuthenticationRegistering extends AuthenticationState {}


// * Registering State
class AuthenticationRegistered extends AuthenticationState {}


// * Logging In State
class AuthenticationLogginIn extends AuthenticationState {}


// * Logged In State
class AuthenticationLoggedIn extends AuthenticationState {

  final User user;
  final firebaseAuth.UserCredential? userCredential;
  final AuthenticationType authenticationType;

  const AuthenticationLoggedIn({
    required this.user,
    required this.userCredential,
    required this.authenticationType,
  });

  @override
  List<Object?> get props => [user, userCredential, authenticationType];

}


// * Logging Out State
class AuthenticationLoggingOut extends AuthenticationState {}


// * Logged Out State
class AuthenticationLoggedOut extends AuthenticationState {}


// * Error State
class AuthenticationError extends AuthenticationState {

  final String errorMessage;
  final StackTrace? stackTrace;

  const AuthenticationError({
    required this.errorMessage,
    this.stackTrace
  });

  @override
  List<Object?> get props => [errorMessage, stackTrace];
  
}