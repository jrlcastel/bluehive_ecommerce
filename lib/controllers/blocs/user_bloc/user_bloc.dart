import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {


  final FirebaseEmailAuthenticationBloc firebaseEmailAuthenticationBloc;


  UserBloc({
    required this.firebaseEmailAuthenticationBloc,
  }) : super(UserInitial()) {


    // * Listen to FirebaseEmailAuthenticationBloc bloc
    firebaseEmailAuthenticationBloc.stream.listen((_authState) {

        // * Auth loading states
        if (_authState is FirebaseEmailAuthenticationLoading || 
            _authState is FirebaseEmailAuthenticationLoggingOut
        ) {
          debugPrint('UserState - loading');
          add(LoadUser());
        }
        // * Auth logged in states
        else if(_authState is FirebaseEmailAuthenticationLoggedIn) {
          add(SetUser(userCredential: _authState.userCredential));
        }
        // * Auth logged out states
        else if (
          _authState is FirebaseEmailAuthenticationLoggingIn || 
          _authState is FirebaseEmailAuthenticationInitial ||
          _authState is FirebaseEmailAuthenticationLoggedOut ||
          _authState is FirebaseEmailAuthenticationRegistering ||
          _authState is FirebaseEmailAuthenticationRegistered
        ) {
          add(UnsetUser());
        } 
        // * Auth error states
        else if (_authState is FirebaseEmailAuthenticationError) {
          add(const SetUserError(errorMessage: 'Authentication Error.'));
        }
        // * Auth unknown error states
        else {
          add(const SetUserError(errorMessage: 'Unknown state.'));
        }
     });



     // * Set User Event
     on<SetUser>((event, emit) async {
       emit(UserAuthenticated(userCredential: event.userCredential));
     });

     // * Unset User Event
     on<UnsetUser>((event, emit) async {
       emit(UserUnauthenticated());
     });

     // * Load User Event
     on<LoadUser>((event, emit) async {
       emit(UserLoading());
     });

     // * Load User Event
     on<SetUserError>((event, emit) async {
       emit(UserError());
     });

      
  }
}
