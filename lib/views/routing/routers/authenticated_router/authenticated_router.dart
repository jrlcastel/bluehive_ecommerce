import 'package:auto_route/auto_route.dart';

import '../../../screens/authenticated_screens/account_screen/account_screen.dart';
import '../../../screens/authenticated_screens/authenticated_screens.dart';
import '../../../screens/authenticated_screens/cart_screen/cart_screen.dart';
import '../../../screens/authenticated_screens/checkout_screen/checkout_screen.dart';
import '../../../screens/authenticated_screens/shop_screen/shop_screen.dart';
import '../../../screens/authenticated_screens/transactions_screen/transactions_screen.dart';

// ? run command - flutter pub run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: [
    // * initial route - contains navigation bar
    AutoRoute(
      path: '/',
      page: AuthenticatedScreens,
      children: [
        // * Shopping Routes
        AutoRoute(
          path: 'shopping',
          name: 'ShoppingRoute',
          page: EmptyRouterPage,
          children: [
            // * Shop Screen
            AutoRoute(
              path: '',
              name: 'ShopRoute',
              page: ShopScreen,
            ),
          ]
        ),
        // * Cart Routes
        AutoRoute(
          path: 'cart',
          name: 'CartRoutes',
          page: EmptyRouterPage,
          children: [
            // * Shop Screen
            AutoRoute(
              path: '',
              name: 'CartRoute',
              page: CartScreen,
            ),
            // * Product Screen
            AutoRoute(
              path: 'checkout',
              name: 'CheckoutRoute',
              page: CheckoutScreen,
            ),
          ]
        ),
        AutoRoute(
          path: 'account',
          name: 'AccountOptionsRoute',
          page: EmptyRouterPage,
          children: [
            // * Account Screen
            AutoRoute(
              path: '',
              name: 'AccountRoute',
              page: AccountScreen,
            ),
            // * Transactions Screen
            AutoRoute(
              path: 'transactions',
              name: 'TransactionsRoute',
              page: TransactionsScreen,
            ),
          ]
        ),
      ]
    ),
  ]
)

class $AuthenticatedRouter {}