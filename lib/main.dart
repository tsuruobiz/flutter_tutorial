import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.yellow,
            child: const Column(
              children: [
                Text('こんにちは世界!'),
                Text('こんにちは世界!'),
                Text('こんにちは世界!'),
                Text('こんにちは世界!'),
                Row(
                  children: [
                    Text('こんにちは世界!'),
                    Icon(Icons.star, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
