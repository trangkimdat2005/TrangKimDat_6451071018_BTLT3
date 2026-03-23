import 'package:flutter/material.dart';

class TappableBox extends StatelessWidget {
  const TappableBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hiển thị SnackBar khi tap
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You tapped the box!'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Tap Me!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}