import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../controllers/blocs/user_bloc/user_bloc.dart';
import '../../../controllers/repositories/cart_repository.dart';
import '../../../packages/custom_bottom_navigation_bar/models/custom_bottom_navigation_bar_button_data.dart';
import '../../../packages/custom_bottom_navigation_bar/models/custom_bottom_navigation_bar_item.dart';
import '../../../packages/custom_bottom_navigation_bar/views/custom_bottom_navigation_bar.dart';
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

    _buttonDataList = [
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
    
    final _userState = context.read<UserBloc>().state;
    String _userId = '';

    if(_userState is UserAuthenticated) {
      _userId = _userState.user.id;
    }

    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    final _cartRepository = CartRepository(firebaseFirestore: _firebaseFirestore);
    final _cartBloc = CartBloc(cartRepository: _cartRepository, userId: _userId);

    // blocs that require USER ID
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => _cartBloc)),
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