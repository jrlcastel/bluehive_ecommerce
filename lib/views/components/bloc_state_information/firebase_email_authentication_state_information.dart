import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';
import '_bloc_state_information.dart';

class FirebaseEmailAuthenticationStateInformation extends StatelessWidget {
  const FirebaseEmailAuthenticationStateInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseEmailAuthenticationBloc, FirebaseEmailAuthenticationState>(
      builder: (context, state) {
        
        // * Error State
        if(state is FirebaseEmailAuthenticationError) {
          return BlocStateInformation(
            text: state.errorMessage,
            color: Colors.red,
          );
        }
        else if (state is FirebaseEmailAuthenticationLoggingIn) {
          return const BlocStateInformation(
            text: 'Logging in...',
            color: Colors.green,
          );
        }
        else if (state is FirebaseEmailAuthenticationRegistering) {
          return const BlocStateInformation(
            text: 'Registering...',
            color: Colors.green,
          );
        }
        else if (state is FirebaseEmailAuthenticationRegistering) {
          return const BlocStateInformation(
            text: 'Registered',
            color: Colors.blue,
          );
        }
        else {
          return Container();
        }
      },
    );
  }
}