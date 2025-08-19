import 'package:flutter/material.dart';

void main() {
  runApp(const Task32App());
}

class Task32App extends StatelessWidget {
  const Task32App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 32 Custom Button",
      debugShowCheckedModeBanner: false,
      home: const CustomButtonScreen(),
    );
  }
}

class CustomButtonScreen extends StatelessWidget {
  const CustomButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Button")),
      body: Center(
        child: CustomButton(
          icon: Icons.star,
          text: "Favorite",
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Custom Button Pressed!")),
            );
          },
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              child: Icon(
                icon,
                size: 32,
                color: Colors.blue,
              ),
            ),
            Positioned(
              bottom: 15,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
