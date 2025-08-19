import 'package:flutter/material.dart';

void main() {
  runApp(const Task27App());
}

class Task27App extends StatelessWidget {
  const Task27App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 27 Custom List",
      debugShowCheckedModeBanner: false,
      home: const CustomListScreen(),
    );
  }
}

class CustomListScreen extends StatefulWidget {
  const CustomListScreen({super.key});

  @override
  State<CustomListScreen> createState() => _CustomListScreenState();
}

class _CustomListScreenState extends State<CustomListScreen> {
  final List<String> _items = ["Apple", "Banana", "Mango", "Orange", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🍎 Custom List with ListTile")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.shopping_basket, color: Colors.blue),
              title: Text(
                _items[index],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("This is ${_items[index]}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
               _items.removeAt(index);
                  });
                },
           ),
            ),
          );
        },
      ),
    );
  }
}
