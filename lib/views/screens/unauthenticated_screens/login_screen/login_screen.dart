import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../components/banner/banner.dart';
import '../../../components/bloc_state_information/firebase_email_authentication_state_information.dart';
import '../../../components/custom_button.dart/custom_button.dart';
import '../../../components/custom_dividers/labeled_horizontal_divider.dart';
import '../../../components/header/header.dart';
import '../../../routing/routers/unauthenticated_router/unauthenticated_router.gr.dart';
import 'screen_components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    debugPrint('Rebuild - LoginScreen()');

    double _sideMargin = 15;

    double _screenHeight = MediaQuery.of(context).size.height;

    double _bannerHeight = _screenHeight * .23;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                // * Brand Banner
                BrandBanner(
                  height: _bannerHeight,
                  backgroundColor: Colors.blue[300],
                ),

                
                // * Header
                Header(
                  name: 'Login',
                  margin: EdgeInsets.fromLTRB(_sideMargin, 30, _sideMargin, 0),
                ),

                // * Auth State
                const FirebaseEmailAuthenticationStateInformation(),

                // * Login Form
                const LoginForm(),
          
                // * Forgot Password Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(_sideMargin, 30, _sideMargin, 0),
                  child: Row(
                    children: [
                      // forgot password
                      CustomButton(
                        expanded: true,
                        flex: 1,
                        width: 400,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.grey,
                        borderWidth: 2,
                        borderRadius: 5,
                        name: 'Forgot Password',
                        textSize: 14,
                        textColor: Colors.grey,
                        onTap: () {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                              content: Text('Forgot password function not yet implemented.'),
                              duration: Duration(milliseconds: 700),
                            )
                          );
                        },
                      ),

                      // * Divider
                      Container(width: 20,),
          
          
                      // * Navigate to Registeration Screen Button
                      CustomButton(
                        expanded: true,
                        flex: 1,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.blue,
                        borderWidth: 2,
                        borderRadius: 5,
                        name: 'No account? Register here.',
                        textSize: 14,
                        textColor: Colors.blue,
                        onTap: () {
                          debugPrint('navigate to register screen');
                          context.router.push(const RegisterRoute());
                        },
                      ),
                    ],
                  ),
                ),
                    
                // * Divider
                LabeledHorizontalDivider(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 40, _sideMargin, 0),
                  width: 2,
                  text: 'OR',
                ),
          
          
                // * Login Using Facebook Button
                CustomButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 40, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Login using Facebook',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                        content: Text('Facebook login function not yet implemented.'),
                        duration: Duration(milliseconds: 700),
                      )
                    );
                  },
                ),
          
          
                // * Login Using Google Button
                CustomButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Login using Google',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                        content: Text('Google login function not yet implemented.'),
                        duration: Duration(milliseconds: 700),
                      )
                    );
                  },
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
} 