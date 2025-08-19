//Create an assets folder inside your Flutter project.
Place an image inside it 
Add this line in your pubspec.yaml under flutter:

assets:
  - assets/my_image.jpg
//
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
      home: ImageAssetExample(),
    );
  }
}

class ImageAssetExample extends StatelessWidget {
  const ImageAssetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image.asset Example"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 300,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/my_image.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 300,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/my_image.jpg",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 300,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/my_image.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
