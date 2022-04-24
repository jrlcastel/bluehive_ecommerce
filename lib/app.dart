import 'package:bluehive_exam/controllers/blocs/cart_bloc/cart_bloc.dart';
import 'package:bluehive_exam/controllers/repositories/google_sign_in_repository.dart';
import 'package:bluehive_exam/controllers/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/blocs/authentication_bloc/authentication_bloc.dart';
import 'controllers/blocs/products_bloc/products_bloc.dart';
import 'controllers/blocs/user_bloc/user_bloc.dart';
import 'controllers/repositories/cart_repository.dart';
import 'views/routing/authentication_wrapper/authentication_wrapper.dart';

class BlueHiveEcommerceApp extends StatelessWidget {

  const BlueHiveEcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // repositories
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    final _googleAuthRepositoy = GoogleAuthRepository();
    final _productsRepository = ProductRepository(firebaseFirestore: _firebaseFirestore);

    // try to silently login to previously logged in google account
    final _authBloc = AuthenticationBloc(googleAuthRepository: _googleAuthRepositoy)..add(const AuthenticationGoogleSilentLogin());
    final _userBloc = UserBloc(authenticationBloc: _authBloc);
    final _productsBloc = ProductsBloc(productRepository: _productsRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => _authBloc)),
        BlocProvider(create: ((context) => _userBloc)),
        BlocProvider(create: ((context) => _userBloc)),
        BlocProvider(create: ((context) => _productsBloc)),
      ],
      child: const AuthenticationWrapper()
    );
  }
}