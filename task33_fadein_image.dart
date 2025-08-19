import 'package:flutter/material.dart';

void main() {
  runApp(const Task33App());
}

class Task33App extends StatelessWidget {
  const Task33App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 33 FadeInImage",
      debugShowCheckedModeBanner: false,
      home: const FadeInImageScreen(),
    );
  }
}

class FadeInImageScreen extends StatelessWidget {
  const FadeInImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FadeIn Image Example")),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/placeholder.png', // local image
          image:
              'https://picsum.photos/400/300', // network image for demo
          fadeInDuration: const Duration(seconds: 2),
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
