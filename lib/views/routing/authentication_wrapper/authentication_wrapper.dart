// packages
import 'package:bluehive_exam/views/routing/authentication_wrapper/routes/authenticated_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local files
import '../../../controllers/blocs/user_bloc/user_bloc.dart';
import '../../../packages/user_data_wrapper.dart/user_data_wrapper.dart';
import 'loading_screen.dart';
import 'routes/unauthenticated_routes.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  // avoid re-initialization on widget rebuild
  final Widget _loadingScreen = const UserLoadingScreen();
  final Widget _unauthenticatedRoutes = UnauthenticatedRoutes();
  final Widget _authenticatedRoutes = AuthenticatedRoutes();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, _userState) {

        // * Loading user
        if(_userState is UserLoading) {
          return _loadingScreen;
        }
        // * Logged in
        else if (_userState is UserAuthenticated) {
          return UserDataWrapper(
            user: _userState.userCredential,
            child: _authenticatedRoutes,
          );
        }
        // * Logged out
        else {
          return _unauthenticatedRoutes;
        }

      }
    );
  }
}