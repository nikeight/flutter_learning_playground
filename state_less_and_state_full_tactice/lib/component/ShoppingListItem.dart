import 'package:flutter/material.dart';
import '../callbacks/Callbacks.dart';
import '../model/Product.dart';

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartItemClickedCallback
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartItemClickedCallback;

  Color _getColor(BuildContext context) {
    return inCart
        ? Colors.black54
        : Theme
        .of(context)
        .primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartItemClickedCallback(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(
            product.name[0]
        ),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
