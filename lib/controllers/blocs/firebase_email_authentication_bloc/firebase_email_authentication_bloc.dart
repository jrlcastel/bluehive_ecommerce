import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/repositories/firebase_authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'firebase_email_authentication_event.dart';
part 'firebase_email_authentication_state.dart';

class FirebaseEmailAuthenticationBloc extends Bloc<FirebaseEmailAuthenticationEvent, FirebaseEmailAuthenticationState> {

  final FirebaseAuthenticationRepository firebaseAuthenticationRepository;

  FirebaseEmailAuthenticationBloc({
    required this.firebaseAuthenticationRepository
  }) : super(FirebaseEmailAuthenticationInitial()) {


    // * Login Event
    on<LoginFirebaseEmail>((event, emit) async {

      // emit logging in in state
      emit(FirebaseEmailAuthenticationLoggingIn());
      debugPrint('FirebaseEmailAuthenticationLoggingIn()');

        // ? simulate loading
      // await Future.delayed(const Duration(seconds: 5));

      try {

        // login via firebase repository
        UserCredential _userCredential = await firebaseAuthenticationRepository.emailLogin(email: event.email, password: event.password);

        if(_userCredential.user!=null) {

          // emit logged in state
          emit(FirebaseEmailAuthenticationLoggedIn(userCredential: _userCredential));
          debugPrint('FirebaseEmailAuthenticationLoggedIn()');

        } else {

          // emit errorstate
          emit(const FirebaseEmailAuthenticationError(errorMessage: 'Login failed'));
          debugPrint('FirebaseEmailAuthenticationError()');
          
        }

      } catch (e) {

          // emit errorstate
        emit(FirebaseEmailAuthenticationError(errorMessage: e.toString()));
        debugPrint('FirebaseEmailAuthenticationError()');

      }

    });


    // * Registration Event
    on<RegisterFirebaseEmail>((event, emit) async {
      
      // emit registering in state
      emit(FirebaseEmailAuthenticationRegistering());
      debugPrint('FirebaseEmailAuthenticationRegistering()');

      try {

        // ? simulate loading
        // await Future.delayed(const Duration(seconds: 10));

        // register via repository
        UserCredential _userCredential = await firebaseAuthenticationRepository
          .firebaseEmailRegistration(
            email: event.email,
            password: event.password,
            confirmPassword: event.confirmPassword,
            displayName: event.displayName,
          );

        if(_userCredential.user!=null) {

          // emit successful registration state
          emit(FirebaseEmailAuthenticationRegistered());
          debugPrint('FirebaseEmailAuthenticationRegistered()');

          // emit logged in state
          emit(FirebaseEmailAuthenticationLoggedIn(userCredential: _userCredential));
        debugPrint('FirebaseEmailAuthenticationLoggedIn()');

        } else {

          // emit error state
          emit(const FirebaseEmailAuthenticationError(errorMessage: 'Login failed'));
          debugPrint('FirebaseEmailAuthenticationError()');

        }

      } catch (e) {

        // emit error state
        emit(FirebaseEmailAuthenticationError(errorMessage: e.toString()));
        debugPrint('FirebaseEmailAuthenticationError()');

      }

    });


    // * Logout Event
    on<LogoutFirebaseEmail>((event, emit) async {
        
      // emit logging out state
      emit(FirebaseEmailAuthenticationLoggingOut());
        debugPrint('FirebaseEmailAuthenticationLoggingOut()');

      try {

        // logout
        await firebaseAuthenticationRepository.emailLogout();
        
      // emit logged out state
        emit(FirebaseEmailAuthenticationLoggedOut());
        debugPrint('FirebaseEmailAuthenticationLoggedOut()');

      } catch (e) {
        
        // emit error state
        emit(FirebaseEmailAuthenticationError(errorMessage: e.toString()));
        debugPrint('FirebaseEmailAuthenticationError()');

      }

    });




  }
}

