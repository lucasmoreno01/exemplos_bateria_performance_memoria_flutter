import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityExample extends StatelessWidget {
  const VisibilityExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visibilidade')),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return VisibilityDetector(
            key: Key('item-$index'),
            onVisibilityChanged: (info) {
              final visible = info.visibleFraction > 0;

              debugPrint(
                'Item $index: ${visible ? 'Visível' : 'Fora da tela'}',
              );
            },
            child: Container(
              height: 150,
              margin: const EdgeInsets.all(8),
              color: Colors.blue.shade100,
              alignment: Alignment.center,
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}