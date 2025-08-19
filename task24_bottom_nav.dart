import 'package:flutter/material.dart';

void main() {
  runApp(const Task24App());
}

class Task24App extends StatelessWidget {
  const Task24App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 24 Bottom Nav",
      debugShowCheckedModeBanner: false,
      home: const BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text("📰 News Screen", style: TextStyle(fontSize: 22))),
    Center(child: Text("💬 Messages Screen", style: TextStyle(fontSize: 22))),
    Center(child: Text("👤 Profile Screen", style: TextStyle(fontSize: 22))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
