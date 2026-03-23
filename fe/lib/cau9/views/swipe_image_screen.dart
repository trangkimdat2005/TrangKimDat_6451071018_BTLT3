import 'package:flutter/material.dart';

class SwipeImageScreen extends StatefulWidget {
  const SwipeImageScreen({Key? key}) : super(key: key);

  @override
  State<SwipeImageScreen> createState() => _SwipeImageScreenState();
}

class _SwipeImageScreenState extends State<SwipeImageScreen> {
  int _currentIndex = 0;
  final List<String> _images = [
    '🖼️',
    '🎨',
    '🌈',
  ];

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! > 0) {
      // Swipe right - quay lại hình trước
      setState(() {
        _currentIndex = (_currentIndex - 1).clamp(0, _images.length - 1);
      });
    } else if (details.primaryVelocity! < 0) {
      // Swipe left - xem hình tiếp theo
      setState(() {
        _currentIndex = (_currentIndex + 1).clamp(0, _images.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 9: Swipe đổi hình'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: _onHorizontalDragEnd,
            child: Container(
              color: Colors.lightBlue[100],
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        _images[_currentIndex],
                        style: const TextStyle(fontSize: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Hình ${_currentIndex + 1}/${_images.length}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Swipe sang trái hoặc phải',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
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
