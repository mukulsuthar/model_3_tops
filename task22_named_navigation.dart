import 'package:flutter/material.dart';

void main() {
  runApp(const Task22App());
}

class Task22App extends StatelessWidget {
  const Task22App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 22 Named Navigation',
      debugShowCheckedModeBanner: false,
      // Register named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Go to Details"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: "Hello from Home!",
                );
              },
            ),
            ElevatedButton(
              child: const Text("Go to Settings"),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Receiving arguments
    final message = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text("Details Screen")),
      body: Center(
        child: Text(
          message ?? "No Data Received",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Screen")),
      body: const Center(
        child: Text(
          "This is the Settings Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
