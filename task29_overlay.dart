import 'package:flutter/material.dart';

void main() {
  runApp(const Task29App());
}

class Task29App extends StatelessWidget {
  const Task29App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 29 Overlay",
      debugShowCheckedModeBanner: false,
      home: const OverlayScreen(),
    );
  }
}

class OverlayScreen extends StatelessWidget {
  const OverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Overlay Effect")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background image
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/400/250", // random placeholder image
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            const Text(
              "Welcome to Flutter!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
