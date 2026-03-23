import 'package:flutter/material.dart';
import '../widget/tappable_box.dart'; // Import widget đã tạo

class TapDemoView extends StatelessWidget {
  const TapDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Demo'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const Center(
            // Gọi Widget TappableBox ra giữa màn hình
            child: TappableBox(),
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