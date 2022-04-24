
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local foles
import '../../../controllers/blocs/user_bloc/user_bloc.dart';
import 'loading_screen.dart';
import 'routes/authenticated_routes.dart';
import 'routes/unauthenticated_routes.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  // authenticated routes
  final Widget _authenticatedRoutes = AuthenticatedRoutes();
  // unauthenticated routes
  final Widget _unauthenticatedRoutes = UnauthenticatedRoutes();
  // loading
  final Widget _loadingScreen = const UserLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, _userState) {

        // loading
        if(_userState is UserLoading) {
          return _loadingScreen;
        }
        // authenticated
        else if (_userState is UserAuthenticated) {
          return _authenticatedRoutes;
        }
        // unauthenticated & error
        else if (
          _userState is UserUnauthenticated || 
          _userState is UserError || 
          _userState is UserInitial
        ) {
          return _unauthenticatedRoutes;
        }
        // unknown states
        else {
          return _unauthenticatedRoutes;
        }

      }
    );
  }
}