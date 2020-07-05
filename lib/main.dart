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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          builder: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          builder: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: AuthScreen(),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
          }),
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
