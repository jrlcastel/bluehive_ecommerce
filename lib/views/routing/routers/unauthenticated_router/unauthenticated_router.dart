import 'package:auto_route/auto_route.dart';

import '../../../screens/unauthenticated_screens/login_screen/login_screen.dart';
import '../../../screens/unauthenticated_screens/register_screen/register_screen.dart';

// ? run command - flutter pub run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: [
    CustomRoute(
      path: '/login',
      // path: '/login',
      name: 'LoginRoute',
      page: LoginScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      path: '/register',
      // path: '/register',
      name: 'RegisterRoute',
      page: RegistrationScreen,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ]
)

class $UnauthenticatedRouter { }