import 'package:flutter/material.dart';

void main() {
  runApp(const AvatarBadgeApp());
}

class AvatarBadgeApp extends StatelessWidget {
  const AvatarBadgeApp({super.key});

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
      appBar: AppBar(title: const Text("Avatar Badges")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: const [
            AvatarBadge(
              imageUrl: "https://i.pravatar.cc/150?img=3",
              isOnline: true,
            ),
            SizedBox(width: 20),
            AvatarBadge(
              imageUrl: "https://i.pravatar.cc/150?img=4",
              isOnline: false,
            ),
          ],
        ),
      ),
    );
  }
}
class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  const AvatarBadge({super.key, required this.imageUrl, this.isOnline = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        if (!isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
