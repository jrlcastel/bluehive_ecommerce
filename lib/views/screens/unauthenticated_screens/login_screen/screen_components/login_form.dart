import 'package:bluehive_exam/controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../components/custom_button.dart/custom_button.dart';
import '../../../../components/custom_textfield/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  // * form keys and controllers
  late final GlobalKey<FormState> _loginFormKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // * validators
  // email validator
  final MultiValidator _emailValidator = MultiValidator([
    EmailValidator(errorText: 'Please input valid email format.'),
    RequiredValidator(errorText: 'Email is required.'),
  ]);
  // password validator
  final MultiValidator _passwordValidator = MultiValidator([
    MinLengthValidator(8, errorText: 'Password must be at least 8 characters long.'), 
    RequiredValidator(errorText: 'Password is required.'),
  ]);

  @override
  void initState() {
    super.initState();
    _loginFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    double _sideMargin = 15;

    return Form(
      key: _loginFormKey,
      child: Column(
        children: [


          // * Email Textfield
          CustomTextField(
            margin: EdgeInsets.fromLTRB(_sideMargin, 30, _sideMargin, 0),
            controller: _emailController,
            validator: _emailValidator,
            hintText: 'Email',
          ),
    

          // * Password Textfield
          CustomTextField(
            margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
            controller: _passwordController,
            validator: _passwordValidator,
            hintText: 'Password',
            obscureText: true,
          ),
    

          // * Login Button
          BlocBuilder<FirebaseEmailAuthenticationBloc, FirebaseEmailAuthenticationState>(
            builder: (context, state) {

              String _buttonName = 'Login';
              bool _loggingInState = state is FirebaseEmailAuthenticationLoggingIn;

              if(_loggingInState) _buttonName = 'Logging in...';

              return CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                backgroundColor: Colors.blue,
                borderRadius: 5,
                name: _buttonName,
                textSize: 14,
                textColor: Colors.white,
                onTap: () {
                  
                  // only execute when not logging in
                  if (!_loggingInState) {

                    bool _formValid = _loginFormKey.currentState?.validate() ?? false;
      
                    if(_formValid) {
                      
                      FocusManager.instance.primaryFocus?.unfocus();
      
                      context.read<FirebaseEmailAuthenticationBloc>()
                      .add( LoginFirebaseEmail(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
      
                    }

                  }
    
                },
              );
            },
          ),
          
        ],
      ),
    );
  }
}