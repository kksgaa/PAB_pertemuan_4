import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    final nameCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ...cart.itemsList.map(
              (item) => ListTile(
                title: Text(item.product.name),
                trailing: Text('Rp ${item.totalPrice.toStringAsFixed(0)}'),
                subtitle: Text('Qty: ${item.quantity}'),
              ),
            ),

            const Divider(),

            Text(
              'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              'Shipping Info',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                cart.clear();

                Navigator.popUntil(context, (r) => r.isFirst);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Order placed!')));
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
