import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatesWithRunExample extends StatefulWidget {
  const IsolatesWithRunExample({super.key});

  @override
  State<IsolatesWithRunExample> createState() => _IsolatesExampleState();
}

class _IsolatesExampleState extends State<IsolatesWithRunExample> {
  double value = 0.0;
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
            TextButton(
              onPressed: () async {
                final result = await complexTask();
                setState(() {
                  value = result;
                  print(value);
                });
              },
              child: const Text('Calculate'),
            ),
            Text(
              'Total value is : \n $value',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

Future<double> complexTask() async {
  const double iteration = 1000000000;
  final double photos = await Isolate.run<double>(() {
    double total = 0.0;
    for (var i = 0; i < iteration; i++) {
      total += i;
    }
    return total;
  });
  return photos;
}
