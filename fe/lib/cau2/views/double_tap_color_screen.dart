import 'package:flutter/material.dart';

class DoubleTapColorScreen extends StatefulWidget {
  const DoubleTapColorScreen({Key? key}) : super(key: key);

  @override
  State<DoubleTapColorScreen> createState() => _DoubleTapColorScreenState();
}

class _DoubleTapColorScreenState extends State<DoubleTapColorScreen> {
  Color _squareColor = Colors.blue;

  void _toggleColor() {
    setState(() {
      _squareColor = _squareColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 2: Double Tap đổi màu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onDoubleTap: _toggleColor,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: _squareColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Double Tap',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'MSSV: 6451071018',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
