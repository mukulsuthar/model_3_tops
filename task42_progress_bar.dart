import 'package:flutter/material.dart';

void main() {
  runApp(const ProgressBarApp());
}

class ProgressBarApp extends StatelessWidget {
  const ProgressBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProgressBarScreen(),
    );
  }
}

class ProgressBarScreen extends StatefulWidget {
  const ProgressBarScreen({super.key});

  @override
  State<ProgressBarScreen> createState() => _ProgressBarScreenState();
}

class _ProgressBarScreenState extends State<ProgressBarScreen> {
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom ProgressBar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgressBar(percentage: _progress),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _progress += 0.1;
                  if (_progress > 1.0) _progress = 0.0;
                });
              },
              child: const Text("Increase Progress"),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomProgressBar extends StatelessWidget {
  final double percentage;

  const CustomProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 250 * percentage,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Center(
            child: Text(
              "${(percentage * 100).toInt()}%",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
