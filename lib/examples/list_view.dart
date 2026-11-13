import 'package:flutter/material.dart';

class ListBuilderExample extends StatelessWidget {
  const ListBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista otimizada')),
      body: ListView.builder(
        itemCount: 10000,
        itemExtent: 65,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            title: Text('Item ${index + 1}'),
            subtitle: const Text('Elemento da lista'),
          );
        },
      ),
    );
  }
}