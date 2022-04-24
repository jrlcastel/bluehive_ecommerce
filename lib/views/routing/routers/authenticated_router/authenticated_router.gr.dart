// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../../../screens/authenticated_screens/account_screen/account_screen.dart'
    as _i6;
import '../../../screens/authenticated_screens/authenticated_screens.dart'
    as _i1;
import '../../../screens/authenticated_screens/cart_screen/cart_screen.dart'
    as _i4;
import '../../../screens/authenticated_screens/checkout_screen/checkout_screen.dart'
    as _i5;
import '../../../screens/authenticated_screens/shop_screen/shop_screen.dart'
    as _i3;
import '../../../screens/authenticated_screens/transactions_screen/transactions_screen.dart'
    as _i7;

class AuthenticatedRouter extends _i2.RootStackRouter {
  AuthenticatedRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AuthenticatedScreensRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthenticatedScreens());
    },
    ShoppingRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CartRoutes.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AccountOptionsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ShopRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ShopScreen());
    },
    CartRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CartScreen());
    },
    CheckoutRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CheckoutScreen());
    },
    AccountRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountScreen());
    },
    TransactionsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.TransactionsScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(AuthenticatedScreensRoute.name, path: '/', children: [
          _i2.RouteConfig(ShoppingRoute.name,
              path: 'shopping',
              parent: AuthenticatedScreensRoute.name,
              children: [
                _i2.RouteConfig(ShopRoute.name,
                    path: '', parent: ShoppingRoute.name)
              ]),
          _i2.RouteConfig(CartRoutes.name,
              path: 'cart',
              parent: AuthenticatedScreensRoute.name,
              children: [
                _i2.RouteConfig(CartRoute.name,
                    path: '', parent: CartRoutes.name),
                _i2.RouteConfig(CheckoutRoute.name,
                    path: 'checkout', parent: CartRoutes.name)
              ]),
          _i2.RouteConfig(AccountOptionsRoute.name,
              path: 'account',
              parent: AuthenticatedScreensRoute.name,
              children: [
                _i2.RouteConfig(AccountRoute.name,
                    path: '', parent: AccountOptionsRoute.name),
                _i2.RouteConfig(TransactionsRoute.name,
                    path: 'transactions', parent: AccountOptionsRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.AuthenticatedScreens]
class AuthenticatedScreensRoute extends _i2.PageRouteInfo<void> {
  const AuthenticatedScreensRoute({List<_i2.PageRouteInfo>? children})
      : super(AuthenticatedScreensRoute.name,
            path: '/', initialChildren: children);

  static const String name = 'AuthenticatedScreensRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ShoppingRoute extends _i2.PageRouteInfo<void> {
  const ShoppingRoute({List<_i2.PageRouteInfo>? children})
      : super(ShoppingRoute.name, path: 'shopping', initialChildren: children);

  static const String name = 'ShoppingRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CartRoutes extends _i2.PageRouteInfo<void> {
  const CartRoutes({List<_i2.PageRouteInfo>? children})
      : super(CartRoutes.name, path: 'cart', initialChildren: children);

  static const String name = 'CartRoutes';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AccountOptionsRoute extends _i2.PageRouteInfo<void> {
  const AccountOptionsRoute({List<_i2.PageRouteInfo>? children})
      : super(AccountOptionsRoute.name,
            path: 'account', initialChildren: children);

  static const String name = 'AccountOptionsRoute';
}

/// generated route for
/// [_i3.ShopScreen]
class ShopRoute extends _i2.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i4.CartScreen]
class CartRoute extends _i2.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i5.CheckoutScreen]
class CheckoutRoute extends _i2.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: 'checkout');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i6.AccountScreen]
class AccountRoute extends _i2.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: '');

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i7.TransactionsScreen]
class TransactionsRoute extends _i2.PageRouteInfo<void> {
  const TransactionsRoute()
      : super(TransactionsRoute.name, path: 'transactions');

  static const String name = 'TransactionsRoute';
}
