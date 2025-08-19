import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const ShoppingCartApp(),
    ),
  );
}

// Provider for managing cart
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItem(CartItem item) {
    final index = _items.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      _items[index].quantity += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  final List<CartItem> products = const [
    CartItem(name: "Apple", price: 50),
    CartItem(name: "Banana", price: 20),
    CartItem(name: "Orange", price: 30),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text("Price: ₹${product.price}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      cartProvider.addItem(product);
                    },
                    child: const Text("Add"),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: ₹${cartProvider.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
