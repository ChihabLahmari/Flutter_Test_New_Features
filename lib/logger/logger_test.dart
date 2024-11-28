import 'package:flutter/material.dart';
import 'package:testing_new_things/logger/logger_helper.dart';

class LoggerTest extends StatelessWidget {
  const LoggerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Logger Examples :'),
            TextButton(
              onPressed: () {
                TLoggerHelper.debug('App started successfully');
              },
              child: const Text("Debug"),
            ),
            TextButton(
              onPressed: () {
                TLoggerHelper.info('User logged in with ID: 12345');
              },
              child: const Text("Info"),
            ),
            TextButton(
              onPressed: () {
                TLoggerHelper.warning('API response took longer than expected');
              },
              child: const Text("Warning"),
            ),
            TextButton(
              onPressed: () {
                try {
                  throw Exception('Something went wrong!');
                } catch (e) {
                  TLoggerHelper.error('An error occurred', e);
                }
              },
              child: const Text("Erros"),
            ),
            TextButton(
              onPressed: () {
                fetchData();
              },
              child: const Text("Fetch data from api"),
            ),
          ],
        ),
      ),
    );
  }
}

void fetchData() async {
  try {
    TLoggerHelper.info('Fetching data from API...');
    final response = await Future.delayed(const Duration(seconds: 2)).then(
      (onValue) {
        return 'Result Data';
        // throw Error();
      },
    );
    TLoggerHelper.debug('API Response: $response');
  } catch (e) {
    TLoggerHelper.error('Failed to fetch data', e);
  }
}
