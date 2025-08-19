import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartApp(),
    );
  }
}

class ShoppingCartApp extends StatefulWidget {
  const ShoppingCartApp({super.key});

  @override
  State<ShoppingCartApp> createState() => _ShoppingCartAppState();
}

class _ShoppingCartAppState extends State<ShoppingCartApp> {
  int cartCount = 0;

  final List<String> items = [
    "Apples",
    "Bananas",
    "Oranges",
    "Mangoes",
    "Grapes",
  ];

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 6),
                Text(
                  "$cartCount",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(items[index]),
              trailing: ElevatedButton(
                onPressed: addToCart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Add to Cart"),
              ),
            ),
          );
        },
      ),
    );
  }
}
