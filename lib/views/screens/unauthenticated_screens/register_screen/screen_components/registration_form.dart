import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../controllers/blocs/firebase_email_authentication_bloc/firebase_email_authentication_bloc.dart';
import '../../../../components/custom_button.dart/custom_button.dart';
import '../../../../components/custom_textfield/custom_textfield.dart';

class RegistrationForm extends StatefulWidget {

  const RegistrationForm({
    Key? key
  }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();

}


class _RegistrationFormState extends State<RegistrationForm> {
  
  late final GlobalKey<FormState> _registrationFormKey;
  // late TextEditingController _displayNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

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
  // desiplay name validator
  // final MultiValidator _displayNameValidator = MultiValidator([
  //   RequiredValidator(errorText: 'Display name is required.'),
  // ]);

  @override
  void initState() {
    super.initState();
    _registrationFormKey = GlobalKey<FormState>();
    // _displayNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    double _sideMargin = 15;

    return Form(
      key: _registrationFormKey,
      child: Column(
        children: [
          
          // * Email Textfield
          CustomTextField(
            margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
            controller: _emailController,
            validator: _emailValidator,
            hintText: 'Email',
          ),
    
    
          // * Display Name Textfield
          // CustomTextField(
          //   margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
          //   controller: _displayNameController,
          //   validator: _displayNameValidator,
          //   hintText: 'Display name',
          // ),
    
    
          // * Password Textfield
          CustomTextField(
            margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
            controller: _passwordController,
            validator: _passwordValidator,
            hintText: 'Password',
            obscureText: true,
          ),
    
    
          // * Confirm Password Textfield
          CustomTextField(
            margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
            controller: _confirmPasswordController,
            validator: (val) => MatchValidator(errorText: 'Passwords do not match').validateMatch(val ?? '', _passwordController.text),
            hintText: 'Confirm password',
            obscureText: true,
          ),
    
    
          // * Register Button
          BlocBuilder<FirebaseEmailAuthenticationBloc, FirebaseEmailAuthenticationState>(
            builder: (context, state) {
              

              String _buttonName = 'Register';
              bool _registeringState = state is FirebaseEmailAuthenticationRegistering;

              if(_registeringState) _buttonName = 'Registering...';

              return CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.fromLTRB(_sideMargin, 20, _sideMargin, 0),
                backgroundColor: Colors.blue,
                borderRadius: 5,
                name: _buttonName,
                textSize: 14,
                textColor: Colors.white,
                onTap: () {
                  
                  if (!_registeringState) {

                    bool _formValid = _registrationFormKey.currentState?.validate() ?? false;
      
                    if(_formValid) {
                      
                      FocusManager.instance.primaryFocus?.unfocus();
      
                      context.read<FirebaseEmailAuthenticationBloc>()
                      .add(RegisterFirebaseEmail(
                        email: _emailController.text,
                        password: _passwordController.text,
                        // displayName: _displayNameController.text,
                        displayName: 'empty',
                        confirmPassword: _confirmPasswordController.text,
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