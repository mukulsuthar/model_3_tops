import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Cards")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProfileCard(
            name: "John Doe",
            imageUrl: "https://i.pravatar.cc/150?img=1",
            bio: "Flutter Developer | Coffee Lover | Traveler",
          ),
          SizedBox(height: 16),
          ProfileCard(
            name: "Jane Smith",
            imageUrl: "https://i.pravatar.cc/150?img=2",
            bio: "UI/UX Designer | Music Enthusiast | Blogger",
          ),
        ],
      ),
    );
  }
}

// Custom ProfileCard Widget
class ProfileCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bio,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
