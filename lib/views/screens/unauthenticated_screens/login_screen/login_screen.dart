import 'package:auto_route/auto_route.dart';
import 'package:bluehive_exam/controllers/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bluehive_exam/views/components/custom_dividers/labeled_horizontal_divider.dart';
import 'package:bluehive_exam/views/components/custom_textfield/custom_textfield.dart';
import 'package:bluehive_exam/views/components/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/banner/banner.dart';
import '../../../components/custom_button.dart/custom_button.dart';
import '../../../routing/routers/unauthenticated_router/unauthenticated_router.gr.dart';

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

    // Theme.of(context).appBarTheme;

    // CustomThemeData _theme = CustomTheme.of(context: context);

    // Color _primaryColor = _theme.primaryColor;

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

                // * Email Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 30, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Email',
                ),
          
                
                // * Password Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          

                // * Login Button
                CustomButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Login',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    // context
                    // .read<AuthenticationBloc>()
                    // .add(const AuthenticationEmailLogin(
                    //   email: 'email@website.com',
                    //   password: 'password')
                    // );
                  },
                ),
          
          
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
                        padding: EdgeInsets.symmetric(vertical: 10),
                        // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.grey,
                        borderWidth: 2,
                        borderRadius: 5,
                        name: 'Forgot Password',
                        textSize: 14,
                        textColor: Colors.grey,
                        onTap: () {
                          debugPrint('forgot');
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
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 40, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Login using Facebook',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    debugPrint('Facebook');
                  },
                ),
          
          
                // * Login Using Google Button
                CustomButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  backgroundColor: Colors.blue,
                  borderRadius: 5,
                  name: 'Login using Google',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {

                    context.read<AuthenticationBloc>().add(const AuthenticationGoogleAuthLogin());

                    debugPrint('Google');

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