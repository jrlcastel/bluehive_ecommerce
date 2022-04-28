// import 'package:bluehive_exam/controllers/repositories/google_sign_in_repository.dart';
// import 'package:bluehive_exam/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'authentication_event.dart';
// part 'authentication_state.dart';

// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {


//   final AuthenticationRepository authenticationRepository;


//   AuthenticationBloc({
//     required this.authenticationRepository
//   }) : super(AuthenticationInitial()) {

//   // * Google Auth Silent Login Event
//   on<AuthenticationGoogleSilentLogin>((event, emit) async {

//     // emit a logging in state
//     emit(AuthenticationLogginIn());

//       try {

//         // call Google Auth Repository for Google Login
//         firebaseAuth.UserCredential? _userCredential = await authenticationRepository.googleSilentLogin();

//         // check if firebase google credentials is null
//         if(_userCredential!=null) {

//           // emit logged in state using the previous google acct
//           emit(
//             AuthenticationLoggedIn(
//               user: LocaUserData(
//                 displayName: _userCredential.user?.displayName ?? 'not set',
//                 email: _userCredential.user?.email ?? 'not set',
//                 userId: _userCredential.user!.uid,
//               ),
//               userCredential: _userCredential,
//               authenticationType: AuthenticationType.google
//             )
//           );
//         }
//         else {
//           // cant login to previous google account
//           emit( const AuthenticationError(errorMessage: 'Cant login to previous google account.'));
//         }

//       }
//       // error user login
//       catch (error) {
//         emit( const AuthenticationError(errorMessage: 'Error calling Firebase'));
//       }

//     });
    

//      // * Google Auth Login Event
//     on<AuthenticationGoogleAuthLogin>((event, emit) async {

//       debugPrint('\nWARNING: AuthenticationGoogleAuthLogin event guards not set. Event will always fully execute.');

//       // emit a logging in state
//       emit(AuthenticationLogginIn());

//       // simulate server loading
//       // await Future.delayed(const Duration(seconds: 1));

//       try {

//         // call Google Auth Repository for Google Login
//         firebaseAuth.UserCredential? _userCredential = await authenticationRepository.googleLogin();

//         if(_userCredential==null) {
//           emit(const AuthenticationError(errorMessage: 'Google authentication failed. Returned null.'));
//         }
//         else {
//           emit(
//             AuthenticationLoggedIn(
//               user: LocaUserData(
//                 displayName: _userCredential.user?.displayName ?? 'not set',
//                 email: _userCredential.user?.email ?? 'not set',
//                 userId: _userCredential.user!.uid,
//               ),
//               userCredential: _userCredential,
//               authenticationType: AuthenticationType.google
//             )
//           );
//         }

//       }
//       // error user login
//       catch (error) {
//         emit( const AuthenticationError(errorMessage: 'Error calling Firebase'));
//       }

//     });
    

//      // * Email Login Event
//     on<AuthenticationEmailLogin>((event, emit) async {

//       debugPrint('\nWARNING: AuthenticationEmailLogin event guards not set. Event will always fully execute.');

//       // emit a logging in state
//       emit(AuthenticationLogginIn());

//       // simulate server loading
//       // await Future.delayed(const Duration(seconds: 1));

//       // emit successful log in state 
//       emit(AuthenticationLoggedIn(
//         userCredential: null,
//         authenticationType: AuthenticationType.email,
//         user: LocaUserData(
//           email: 'sampleEmail@email.com',
//           displayName: 'displayName',
//           userId: 'id'
//         ),
//       ));

//     });


//     // * Logout Event
//     // todo remove user creds / expire tokens in repo
//     on<AuthenticationLogout>((event, emit) async {
      
//       final _state = state;

//       debugPrint('\nWARNING: AuthenticationLogout event guards not set. Event will always fully execute.');

//       // loading state during logout
//       emit(AuthenticationLoggingOut());
      
//       // simulate server loading
//       // await Future.delayed(const Duration(seconds: 1));

//       // logout using google if has google credential logged in, otherwise logout using email
//       // todo: wrap with try catch
//       try {
//         if(_state is AuthenticationLoggedIn) {
        
//           // if google was used to log in
//           if(_state.userCredential!=null) {
//             await authenticationRepository.googelLogout();
//           } 
//           // if email was used to log in
//           else {
//             // todo: add email logout method here
//           }
        
//         }
        
//           // emit successful log out state 
//           emit(AuthenticationLoggedOut());

//       } on Exception catch (_) {
//         // error logging out
//         emit(const AuthenticationError(errorMessage: 'Failed to logout.'));
//       }

//     });


//     // * Email Registration Event
//     on<AuthenticationEmailRegistration>((event, emit) async {

//       debugPrint('\nWARNING: AuthenticationEmailRegistration event guards not set. Event will always fully execute.');

//       // registering state
//       emit(AuthenticationRegistering());
      
//       // simulate server loading
//       // await Future.delayed(const Duration(seconds: 1));

//       // emit successful registration state 
//       emit(AuthenticationRegistered());

//     });

//   }


// }
