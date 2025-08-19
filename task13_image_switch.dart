import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageSwitcherApp(),
    );
  }
}

class ImageSwitcherApp extends StatefulWidget {
  const ImageSwitcherApp({super.key});

  @override
  State<ImageSwitcherApp> createState() => _ImageSwitcherAppState();
}

class _ImageSwitcherAppState extends State<ImageSwitcherApp> {
  // two different image URLs
  String imageUrl1 =
      "https://picsum.photos/400/300?image=10";  
  String imageUrl2 =
      "https://picsum.photos/400/300?image=20";  

  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Switcher"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              showFirst ? imageUrl1 : imageUrl2,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showFirst = !showFirst;
                });
              },
              child: const Text("Change Image"),
            ),
          ],
        ),
      ),
    );
  }
}
