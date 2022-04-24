import 'package:bluehive_exam/controllers/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/authentication_bloc/authentication_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {

                    context.read<AuthenticationBloc>().add(AuthenticationLogout());
                    
                  },
                  child: Text('Logout')
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}