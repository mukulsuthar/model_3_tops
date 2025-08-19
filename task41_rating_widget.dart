import 'package:flutter/material.dart';

void main() {
  runApp(const RatingApp());
}

class RatingApp extends StatelessWidget {
  const RatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Rating Widget")),
      body: Center(
        child: RatingWidget(
          rating: _currentRating,
          onRatingSelected: (rating) {
            setState(() {
              _currentRating = rating;
            });
          },
        ),
      ),
    );
  }
}
class RatingWidget extends StatelessWidget {
  final int rating;
  final Function(int) onRatingSelected;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        int starIndex = index + 1;
        return IconButton(
          icon: Icon(
            starIndex <= rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 36,
          ),
          onPressed: () {
            onRatingSelected(starIndex);
          },
        );
      }),
    );
  }
}
