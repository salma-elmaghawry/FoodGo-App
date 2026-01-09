import 'package:flutter/material.dart';
import 'package:foodgo_app/Features/cart/UI/widgets/cart_item_card.dart';
import 'package:foodgo_app/Features/cart/data/models/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<Product> products;
  const CartScreen({super.key, required this.products});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return CartItemCard(
                  imageUrl: widget.products[index].imageUrl,
                  title: widget.products[index].title,
                  subtitle: widget.products[index].subtitle,
                  quantity: widget.products[index].quantity,
                  onIncrement: () {
                    setState(() {
                      widget.products[index].quantity++;
                    });
                  },
                  onDecrement: () {
                    if (widget.products[index].quantity > 1) {
                      setState(() {
                        widget.products[index].quantity--;
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
