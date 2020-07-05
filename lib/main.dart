import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_product.screen.dart';
import './screens/orders_screen.dart';
import './screens/cart_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          builder: (ctx, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          builder: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          builder: (ctx, auth, previousOrders) => Orders(
              auth.token, previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
            routes: {
              ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductScreen.routeName: (ctx) => UserProductScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen()
            }),
      ),
    );
  }
}

// Approach 1:
// return ChangeNotifierProvider(
//       builder: (ctx) => Products(),

// Approach 2:
// return ChangeNotifierProvider.value(
//     value: Products(),

//  Approach 2 we use if provider is part of list or grid otherwise Approach 1
// because where data changes in provider there build method doesnt works properly can therefore we use approach2 with list and.

// ChangeNotifierProvider(
//           builder: (ctx) => Products(),

// Here use 'create' instead of 'builder' if provider version is ^4.0.0
