import 'package:flutter/material.dart';

class GestureGridScreen extends StatefulWidget {
  const GestureGridScreen({Key? key}) : super(key: key);

  @override
  State<GestureGridScreen> createState() => _GestureGridScreenState();
}

class _GestureGridScreenState extends State<GestureGridScreen> {
  late List<bool> _isPressed;

  @override
  void initState() {
    super.initState();
    _isPressed = List<bool>.filled(9, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 8: Gesture trong Grid'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 9,
              padding: const EdgeInsets.all(32),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPressed[index] = !_isPressed[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isPressed[index] ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                );
              },
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
