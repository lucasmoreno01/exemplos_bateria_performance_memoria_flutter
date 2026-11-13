import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

int calculateSum(int limit) {
  int result = 0;

  for (int i = 0; i < limit; i++) {
    result += i;
  }

  return result;
}

class ComputeExample extends StatefulWidget {
  const ComputeExample({super.key});

  @override
  State<ComputeExample> createState() => _ComputeExampleState();
}

class _ComputeExampleState extends State<ComputeExample> {
  String result = 'Aguardando processamento';

  Future<void> process() async {
    final value = await compute(calculateSum, 100000000);

    setState(() {
      result = 'Resultado: $value';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Processamento')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: process,
              child: const Text('Executar processamento'),
            ),
          ],
        ),
      ),
    );
  }
}