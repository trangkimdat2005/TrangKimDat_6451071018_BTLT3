import 'package:flutter/material.dart';

class CustomSliderScreen extends StatefulWidget {
  const CustomSliderScreen({Key? key}) : super(key: key);

  @override
  State<CustomSliderScreen> createState() => _CustomSliderScreenState();
}

class _CustomSliderScreenState extends State<CustomSliderScreen> {
  double _sliderValue = 50;
  final double _sliderWidth = 250;
  final double _thumbRadius = 15;

  void _onPanUpdate(DragUpdateDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);
    final double sliderLeft = (MediaQuery.of(context).size.width - _sliderWidth) / 2;
    final double relativeX = localPosition.dx - sliderLeft - _thumbRadius;
    
    setState(() {
      _sliderValue = (relativeX / (_sliderWidth - _thumbRadius * 2) * 100).clamp(0, 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 7: Kéo thanh Slider'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Giá trị: ${_sliderValue.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 48),
                GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  child: Container(
                    width: _sliderWidth,
                    height: 50,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        // Thanh ngang
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 20,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        // Thanh tiến trình
                        Positioned(
                          left: 0,
                          top: 20,
                          child: Container(
                            width: (_sliderWidth - _thumbRadius * 2) * (_sliderValue / 100),
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        // Nút tròn
                        Positioned(
                          left: (_sliderWidth - _thumbRadius * 2) * (_sliderValue / 100),
                          top: 10,
                          child: Container(
                            width: _thumbRadius * 2,
                            height: _thumbRadius * 2,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
