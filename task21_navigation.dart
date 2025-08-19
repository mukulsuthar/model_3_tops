import 'package:flutter/material.dart';

void main() {
  runApp(const Task21App());
}

class Task21App extends StatelessWidget {
  const Task21App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 21 Navigation',
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Second Screen"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(
        child: Text(
          "Welcome to the Second Screen!",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
