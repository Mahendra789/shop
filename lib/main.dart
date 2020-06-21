import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
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


