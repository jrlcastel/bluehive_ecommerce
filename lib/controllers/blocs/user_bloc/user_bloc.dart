import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bluehive_exam/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final AuthenticationBloc authenticationBloc;
  // late StreamSubscription subscription;

  UserBloc({
    required this.authenticationBloc,
  }) : super(UserInitial()) {

    // * Authentication State listener
    authenticationBloc.stream.listen((_authState) {

        // auth loading states
        if (_authState is AuthenticationLoading || 
            _authState is AuthenticationLogginIn || 
            _authState is AuthenticationLoggingOut
        ) {
          debugPrint('UserState - loading');
          add(LoadUser());
        }
        // if authentication state is logged in, simulate a SetUser event
        else if(_authState is AuthenticationLoggedIn) {
          add(SetUser(user: _authState.user, userCredential: _authState.userCredential));
        }
        // user not set
        else if (
          _authState is AuthenticationInitial ||
          _authState is AuthenticationLoggedOut
        ) {
          add(UnsetUser());
        } 
        // user error
        else if (_authState is AuthenticationError) {
          add(const SetUserError(errorMessage: 'Authentication Error.'));
        }
        // unknown error
        else {
          add(const SetUserError(errorMessage: 'Unknown error.'));
        }
     });



     // * Set User Event
     on<SetUser>((event, emit) async {
       emit(UserAuthenticated(userCredential: event.userCredential, user: event.user));
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
