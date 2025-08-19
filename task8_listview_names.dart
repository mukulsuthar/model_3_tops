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
      home: NamesList(),
    );
  }
}

class NamesList extends StatelessWidget {
  const NamesList({super.key});

  final List<String> names = const [
    "Mukul",
    "Yasha",
    "Harshita",
    "Jay",
    "Nikhil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Names List"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print("${names[index]} tapped");
            },
          );
        },
      ),
    );
  }
}
