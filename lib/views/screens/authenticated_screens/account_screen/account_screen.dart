import 'package:auto_route/auto_route.dart';
import 'package:bluehive_exam/views/routing/routers/authenticated_router/authenticated_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';

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

              Expanded(
                child: Container(
                  // color: Colors.amber,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.push(const TransactionsRoute());
                          },
                          child: Container(
                            color: Colors.grey[300],
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Row(
                              children: [

                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Icon(
                                      Icons.list_alt,
                                      size: 30,
                                    ),
                                  ),

                                  Text('Transactions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),)
                                ],
                            ),
                          ),
                        )
                      ]
                    )
                  )
                )
              ),

              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {

                    context.read<FirebaseEmailAuthenticationBloc>()
                      .add(LogoutFirebaseEmail());
                    
                  },
                  child: const Text('Logout')
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}