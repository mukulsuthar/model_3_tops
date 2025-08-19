import 'package:flutter/material.dart';

void main() {
  runApp(const Task34App());
}

class Task34App extends StatelessWidget {
  const Task34App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 34 AnimatedContainer",
      debugShowCheckedModeBanner: false,
      home: const ExpandCollapseScreen(),
    );
  }
}

class ExpandCollapseScreen extends StatefulWidget {
  const ExpandCollapseScreen({super.key});

  @override
  State<ExpandCollapseScreen> createState() => _ExpandCollapseScreenState();
}

class _ExpandCollapseScreenState extends State<ExpandCollapseScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expand/Collapse Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: 250,
              height: _isExpanded ? 200 : 60,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Expandable Content",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? "Collapse" : "Expand"),
            ),
          ],
        ),
      ),
    );
  }
}
