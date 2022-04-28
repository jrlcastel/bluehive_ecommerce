import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';
import 'controllers/blocs/user_bloc/user_bloc.dart';
import 'controllers/repositories/firebase_authentication_repository.dart';
import 'views/routing/authentication_wrapper/authentication_wrapper.dart';

class BlueHiveEcommerceApp extends StatelessWidget {

  const BlueHiveEcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Firebase auth instance
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    // repositories
    FirebaseAuthenticationRepository _firebaseAuthenticationRepository = FirebaseAuthenticationRepository(firebaseAuth: _firebaseAuth);

    // blocs
    final _firebaseAuthenticationBloc = FirebaseEmailAuthenticationBloc(firebaseAuthenticationRepository: _firebaseAuthenticationRepository);
    final _userBloc = UserBloc(firebaseEmailAuthenticationBloc: _firebaseAuthenticationBloc);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => _firebaseAuthenticationBloc)),
        BlocProvider(create: ((context) => _userBloc)),
      ],
      child: const AuthenticationWrapper()
    );
  }
}