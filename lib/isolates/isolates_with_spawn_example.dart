import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatesWithSpawnExample extends StatelessWidget {
  const IsolatesWithSpawnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(complexTask1, receivePort.sendPort);
                receivePort.listen((total) {
                  debugPrint('Result 1: $total');
                });
              },
              child: const Text('Call Task 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();
                await Isolate.spawn(complexTask2, (iteration: 1000000000, sendPort: receivePort.sendPort));
                receivePort.listen((total) {
                  debugPrint('Result 2: $total');
                });
              },
              child: const Text('Call Task 2'),
            ),
          ],
        ),
      ),
    );
  }
}

complexTask1(SendPort sendPort) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}

complexTask2(({int iteration, SendPort sendPort}) data) {
  var total = 0.0;
  for (var i = 0; i < data.iteration; i++) {
    total += i;
  }
  data.sendPort.send(total);
}
