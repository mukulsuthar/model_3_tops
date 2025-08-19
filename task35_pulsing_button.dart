import 'package:flutter/material.dart';

void main() {
  runApp(const PulsingButtonApp());
}

class PulsingButtonApp extends StatelessWidget {
  const PulsingButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PulsingButtonScreen(),
    );
  }
}

class PulsingButtonScreen extends StatefulWidget {
  const PulsingButtonScreen({super.key});

  @override
  State<PulsingButtonScreen> createState() => _PulsingButtonScreenState();
}

class _PulsingButtonScreenState extends State<PulsingButtonScreen>
    with SingleTickerProviderStateMixin {
  bool _isPulsing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pulsing Button")),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: _isPulsing ? 1.2 : 1.0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          onEnd: () {
            setState(() {
              _isPulsing = !_isPulsing;
            });
          },
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Button Pressed!")),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    "Pulse Button",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
