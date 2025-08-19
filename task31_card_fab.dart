import 'package:flutter/material.dart';

void main() {
  runApp(const Task31App());
}

class Task31App extends StatelessWidget {
  const Task31App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 31 Card with FAB",
      debugShowCheckedModeBanner: false,
      home: const CardWithFab(),
    );
  }
}

class CardWithFab extends StatelessWidget {
  const CardWithFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card with FAB")),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Task 31",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This is a simple card UI with a floating action button placed at the bottom-right corner using Stack & Positioned.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("FAB Pressed!")),
                  );
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
