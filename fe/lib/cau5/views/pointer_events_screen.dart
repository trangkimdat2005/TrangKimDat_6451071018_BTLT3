import 'package:flutter/material.dart';

class PointerEventsScreen extends StatefulWidget {
  const PointerEventsScreen({Key? key}) : super(key: key);

  @override
  State<PointerEventsScreen> createState() => _PointerEventsScreenState();
}

class _PointerEventsScreenState extends State<PointerEventsScreen> {
  double _pointerX = 0;
  double _pointerY = 0;

  void _onPointerMove(PointerMoveEvent event) {
    setState(() {
      _pointerX = event.position.dx;
      _pointerY = event.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 5: Pointer Events cơ bản'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Listener(
        onPointerMove: _onPointerMove,
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue[100],
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chạm vào màn hình',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'X: ${_pointerX.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Y: ${_pointerY.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall,
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
      ),
    );
  }
}
