import 'package:flutter/material.dart';
import 'package:state_less_and_state_full_tactice/component/ShoppingListItem.dart';

import '../model/Product.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart List"),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          children: widget.products.map((product) {
            return ShoppingListItem(
                product: product,
                inCart: _shoppingCart.contains(product),
                onCartItemClickedCallback: _handleCartChanged);
          }).toList()),
    );
  }
}
