import 'package:flutter/material.dart';
import 'cau1/apps/cau1_app.dart';
import 'cau2/apps/cau2_app.dart';
import 'cau3/apps/cau3_app.dart';
import 'cau4/apps/cau4_app.dart';
import 'cau5/apps/cau5_app.dart';
import 'cau6/apps/cau6_app.dart';
import 'cau7/apps/cau7_app.dart';
import 'cau8/apps/cau8_app.dart';
import 'cau9/apps/cau9_app.dart';
import 'cau10/apps/cau10_app.dart';

void main() {
  runApp(const MainMenuApp());
}

class MainMenuApp extends StatelessWidget {
  const MainMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTLT Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTLT Flutter - Chọn Bài'),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildMenuButton(
                context,
                'Bài 1: Hello World',
                () => _navigateToCau(context, const Cau1App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 2: Double Tap đổi màu',
                () => _navigateToCau(context, const Cau2App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 3: Long Press hiển thị thông báo',
                () => _navigateToCau(context, const Cau3App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 4: Đếm số lần Tap',
                () => _navigateToCau(context, const Cau4App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 5: Pointer Events cơ bản',
                () => _navigateToCau(context, const Cau5App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 6: Kéo hình tròn',
                () => _navigateToCau(context, const Cau6App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 7: Kéo thanh Slider',
                () => _navigateToCau(context, const Cau7App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 8: Gesture trong Grid',
                () => _navigateToCau(context, const Cau8App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 9: Swipe đổi hình',
                () => _navigateToCau(context, const Cau9App()),
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                context,
                'Bài 10: Kéo để xóa item',
                () => _navigateToCau(context, const Cau10App()),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
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

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.blue,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  void _navigateToCau(BuildContext context, Widget app) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => app,
      ),
    );
  }
}
