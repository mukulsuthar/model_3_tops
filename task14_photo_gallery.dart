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
      home: PhotoGallery(),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  // List of image URLs
  final List<String> imageUrls = const [
   "https://www.google.com/url?sa=i&url=https%3A%2F%2Fhatrabbits.com%2Fen%2Frandom-image%2F&psig=AOvVaw3n6gAre_w-c8fGQTwHw8Y7&ust=1755712076895000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC87J-3l48DFQAAAAAdAAAAABAE",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbitfieldconsulting.com%2Fposts%2Frandom-testing&psig=AOvVaw3n6gAre_w-c8fGQTwHw8Y7&ust=1755712076895000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC87J-3l48DFQAAAAAdAAAAABAJ",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbitfieldconsulting.com%2Fposts%2Ftype-sets&psig=AOvVaw3n6gAre_w-c8fGQTwHw8Y7&ust=1755712076895000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC87J-3l48DFQAAAAAdAAAAABAQ",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.linkedin.com%2Fpulse%2Fjitter-proof-race-conditions-imam-aprido-simarmata-xcs1c&psig=AOvVaw3n6gAre_w-c8fGQTwHw8Y7&ust=1755712076895000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC87J-3l48DFQAAAAAdAAAAABAX",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P
