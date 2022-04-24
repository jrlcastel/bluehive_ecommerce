import 'package:auto_route/auto_route.dart';
import 'package:bluehive_exam/controllers/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/banner/banner.dart';
import '../../../components/custom_button.dart/custom_button.dart';
import '../../../components/custom_dividers/labeled_horizontal_divider.dart';
import '../../../components/custom_textfield/custom_textfield.dart';
import '../../../components/header/header.dart';
import '../../../routing/routers/unauthenticated_router/unauthenticated_router.gr.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key? key
  }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

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
                  name: 'Register',
                  margin: EdgeInsets.fromLTRB(_sideMargin, 30, _sideMargin, 0),
                ),


                // * Email Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Email',
                ),


                // * Display Name Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Display name',
                ),


                // * Password Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Password',
                  obscureText: true,
                ),


                // * Confirm Password Textfield
                CustomTextField(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  controller: usernameController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),


                // * Register Button
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, _authState) {
                    
                    String _buttonName = 'Register';

                    if(_authState is AuthenticationRegistering) _buttonName = 'Registering';
                    
                    if(_authState is AuthenticationRegistered) _buttonName = 'Registered';

                    return CustomButton(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                      backgroundColor: Colors.grey,
                      borderRadius: 5,
                      name: _buttonName,
                      textSize: 14,
                      textColor: Colors.white,
                      onTap: () {
                        
                        // context
                        //   .read<AuthenticationBloc>()
                        //   .add( const AuthenticationEmailRegistration(
                        //     email: 'email',
                        //     displayName: 'displayName', 
                        //     password: 'password', 
                        //     confirmPassword: 'confirmPassword'
                        //   )
                        // );
    
                        // final AuthenticationBloc _authBloc = context.read<AuthenticationBloc>().add(event);
                        
                      },
                    );
                  },
                ),

                // * Reroute to [LoginScreen] Button
                CustomButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.blue,
                  borderWidth: 2,
                  borderRadius: 5,
                  name: 'Already have an account? Login here.',
                  textSize: 14,
                  textColor: Colors.blue,
                  onTap: () {
                    debugPrint('navigate to login screen');
                    AutoRouter.of(context).replace(const LoginRoute());
                  },
                ),
          

                // * Divider
                LabeledHorizontalDivider(
                  margin: EdgeInsets.fromLTRB(_sideMargin, 40, _sideMargin, 0),
                  width: 2,
                  text: 'OR',
                ),
          

                // * Register Using Google Button
                CustomButton(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Register using Google',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    
                    debugPrint('RegisterScreen - \'Register using google\' button pressed.');
                    
                    

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