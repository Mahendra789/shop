import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
  final productId = ModalRoute.of(context).settings.arguments as String;
  final loadedProduct = Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}


//listen: false
//here it is false because we dont want to rebuilt widget on every changes... 