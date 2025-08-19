import 'package:flutter/material.dart';

void main() {
  runApp(const Task28App());
}

class Task28App extends StatelessWidget {
  const Task28App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 28 Product Listing",
      debugShowCheckedModeBanner: false,
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {"name": "Shoes", "price": 1200, "image": Icons.shopping_bag},
    {"name": "Watch", "price": 2500, "image": Icons.watch},
    {"name": "Laptop", "price": 55000, "image": Icons.laptop},
    {"name": "Phone", "price": 30000, "image": Icons.phone_android},
    {"name": "Headphones", "price": 2000, "image": Icons.headphones},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🛒 Product Listing")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Featured Products",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180, // height of the product cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(products[index]["image"], size: 60, color: Colors.blue),
                     const SizedBox(height: 10),
                  Text(
                          products[index]["name"],
                style: const TextStyle(
                     fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                     Text("₹${products[index]["price"]}",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.green)),
                      ],
                    ),
           );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
