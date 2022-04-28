import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../components/banner/banner.dart';
import '../../../components/bloc_state_information/firebase_email_authentication_state_information.dart';
import '../../../components/custom_button.dart/custom_button.dart';
import '../../../components/custom_dividers/labeled_horizontal_divider.dart';
import '../../../components/header/header.dart';
import '../../../routing/routers/unauthenticated_router/unauthenticated_router.gr.dart';
import 'screen_components/registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key? key
  }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


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

                // * Auth State
                const FirebaseEmailAuthenticationStateInformation(),

                // * Registration Form
                const RegistrationForm(),
                

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
                  margin: EdgeInsets.fromLTRB(_sideMargin, 40, _sideMargin, 0),
                  backgroundColor: Colors.grey,
                  borderRadius: 5,
                  name: 'Register using Google',
                  textSize: 14,
                  textColor: Colors.white,
                  onTap: () {
                    ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                        content: Text('Google Registration function not yet implemented.'),
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