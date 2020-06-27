import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../screens/product_details_screen.dart';
import './../providers/product.dart';
import './../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => 
              IconButton(
                icon: Icon(product.isFavorites
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItems(product.id, product.price, product.title);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Added item to cart'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(label: 'UNDO', onPressed: (){
                  cart.removeSingleItem(product.id);
                },),
                
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Consumer widget we use if we dont want to build whole widget tree anf only widget which is changed. 
// for that in provider we do (listen:false) and wrap widget which is getting changed with consumer. 
// it also has child properly in which we can define a child of that widget which doesnts changes and 
// we dont want rebuild it again.
