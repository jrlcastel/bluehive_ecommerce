import 'package:auto_route/auto_route.dart';
import 'package:bluehive_exam/controllers/blocs/transaction_details_bloc/transaction_details_bloc.dart';
import 'package:bluehive_exam/controllers/repositories/product_repository.dart';
import 'package:bluehive_exam/controllers/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../controllers/blocs/products_bloc/products_bloc.dart';
import '../../../controllers/repositories/cart_repository.dart';
import '../../../packages/custom_bottom_navigation_bar/models/custom_bottom_navigation_bar_button_data.dart';
import '../../../packages/custom_bottom_navigation_bar/models/custom_bottom_navigation_bar_item.dart';
import '../../../packages/custom_bottom_navigation_bar/views/custom_bottom_navigation_bar.dart';
import '../../../packages/user_data_wrapper.dart/user_data_wrapper.dart';
import '../../routing/routers/authenticated_router/authenticated_router.gr.dart';


class AuthenticatedScreens extends StatefulWidget {
  const AuthenticatedScreens({Key? key}) : super(key: key);

  @override
  State<AuthenticatedScreens> createState() => _AuthenticatedScreensState();
}


class _AuthenticatedScreensState extends State<AuthenticatedScreens> {

  late final List<CustomBottomNavigationBarItem> _buttonDataList;

  @override
  void initState() {

    super.initState();

    // * Bottom navigation buttons 
    _buttonDataList = [

      // * Products screen button
      CustomBottomNavigationBarItem(
        buttonData: CustomBottomNavigationBarButtonData(
          activeIcon: Icons.store_mall_directory,
          inactiveIcon: Icons.store_mall_directory_outlined,
          active: false,
          iconSize: 30,
          verticalPadding: 10,
        ),
        route: const ShoppingRoute(),
      ),

      // * Cart Screen button
      CustomBottomNavigationBarItem(
        buttonData: CustomBottomNavigationBarButtonData(
          activeIcon: Icons.shopping_cart,
          inactiveIcon: Icons.shopping_cart_outlined,
          active: false,
          iconSize: 30,
          verticalPadding: 10,
        ),
        route: const CartRoutes(),
      ),
      
      // * Account screen button
      CustomBottomNavigationBarItem(
        buttonData: CustomBottomNavigationBarButtonData(
          activeIcon: Icons.account_circle,
          inactiveIcon: Icons.account_circle_outlined,
          active: false,
          iconSize: 30,
          verticalPadding: 10,
        ),
        route: const AccountOptionsRoute(),
      ),

    ];
  }


  @override
  Widget build(BuildContext context) {

    // debug - rebuild notification msg
    debugPrint("Rebuild: RouterAuthenticatedHomePage()");
    
    // * get user details
    UserCredential _userCredential = UserDataWrapper.of(context: context).currentUser;
    String _userId = _userCredential.user!.uid;

    // * instantiate firebase
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

    // * initialize repositories
    final CartRepository _cartRepository = CartRepository(firebaseFirestore: _firebaseFirestore);
    final ProductRepository _productRepository = ProductRepository(firebaseFirestore: _firebaseFirestore);
    final TransactionDetailsRepository _transactionDetailsRepository = TransactionDetailsRepository(firebaseFirestore: _firebaseFirestore);

    // * initialize blocs
    final ProductsBloc _productBloc = ProductsBloc(productRepository: _productRepository);
    final CartBloc _cartBloc = CartBloc(
      userId: _userId,
      cartRepository: _cartRepository,
      productRepository: _productRepository,
      productsBloc: _productBloc,
    );
    final TransactionDetailsBloc _transactionDetailsBloc = TransactionDetailsBloc(
      cartBloc: _cartBloc,
      cartRepository: _cartRepository,
      transactionDetailsRepository: _transactionDetailsRepository,
      userId: _userId,
    );

    // * provider for blocs that are used only when user is logged in
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => _productBloc)),
        BlocProvider(create: ((context) => _cartBloc)),
        BlocProvider(create: ((context) => _transactionDetailsBloc)),
      ],
      child: AutoTabsScaffold(
        animationDuration: Duration.zero,
        backgroundColor: Colors.white,
        bottomNavigationBuilder: (_, tabsRouter) {
          return CustomBottomNavigationBar(
            buttonDataList: List.generate(_buttonDataList.length, (index) => _buttonDataList[index].buttonData),
            currentIndex: tabsRouter.activeIndex,
            setActiveIndex: tabsRouter.setActiveIndex,
          );
        },
        routes:  List.generate(_buttonDataList.length, (index) => _buttonDataList[index].route),
      ),
    );
  }
}