import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import 'checkout_page.dart'; // ⭐ IMPORT CHECKOUT PAGE

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),

      body: cart.itemsList.isEmpty
          ? const Center(
              child: Text('Cart is empty', style: TextStyle(fontSize: 18)),
            )
          : Column(
              children: [
                /// 🧾 LIST ITEM CART
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemsList.length,
                    itemBuilder: (context, index) {
                      final item = cart.itemsList[index];

                      return ListTile(
                        leading: Text(
                          item.product.emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                        title: Text(item.product.name),
                        subtitle: Text(
                          'Rp ${item.product.price.toStringAsFixed(0)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// ➖ Kurangi jumlah
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cart.decreaseQuantity(item.product.id);
                              },
                            ),

                            Text('${item.quantity}'),

                            /// ➕ Tambah jumlah
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cart.addItem(item.product);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// 💰 TOTAL + CHECKOUT
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// ⭐ TOMBOL CHECKOUT BARU
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CheckoutPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
