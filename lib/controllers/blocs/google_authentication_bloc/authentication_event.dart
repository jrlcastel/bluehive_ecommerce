// part of 'authentication_bloc.dart';

// // * abstraction
// abstract class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();

//   @override
//   List<Object?> get props => [];
// }



// // * Google Auth Login
// class AuthenticationGoogleAuthLogin extends AuthenticationEvent {

//   const AuthenticationGoogleAuthLogin();

//   @override
//   List<Object> get props => [];

// }



// // * Google Silent Login
// class AuthenticationGoogleSilentLogin extends AuthenticationEvent {

//   const AuthenticationGoogleSilentLogin();

//   @override
//   List<Object> get props => [];

// }


// // * Email Login
// class AuthenticationEmailLogin extends AuthenticationEvent {

//   final String email;
//   final String password;

//   const AuthenticationEmailLogin({
//     required this.email,
//     required this.password,
//   });

//   @override
//   List<Object> get props => [email, password];

// }


// // * Email Registration
// class AuthenticationEmailRegistration extends AuthenticationEvent {

//   final String email;
//   final String displayName;
//   final String password;
//   final String confirmPassword;

//   const AuthenticationEmailRegistration({
//     required this.email,
//     required this.displayName,
//     required this.password,
//     required this.confirmPassword,
//   });

//   @override
//   List<Object> get props => [email, password];

// }


// // * Logout
// class AuthenticationLogout extends AuthenticationEvent {

// }