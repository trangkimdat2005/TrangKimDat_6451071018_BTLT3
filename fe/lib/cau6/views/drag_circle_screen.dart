import 'package:flutter/material.dart';

class DragCircleScreen extends StatefulWidget {
  const DragCircleScreen({Key? key}) : super(key: key);

  @override
  State<DragCircleScreen> createState() => _DragCircleScreenState();
}

class _DragCircleScreenState extends State<DragCircleScreen> {
  double _circleX = 0;
  double _circleY = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      setState(() {
        _circleX = (screenWidth / 2) - 40;
        _circleY = (screenHeight / 2) - 100;
      });
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _circleX = details.localPosition.dx - 40;
      _circleY = details.localPosition.dy - 40;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 6: Kéo hình tròn'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onPanUpdate: _onPanUpdate,
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue[100],
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              left: _circleX,
              top: _circleY,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Kéo me',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
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
      ),
    );
  }
}
