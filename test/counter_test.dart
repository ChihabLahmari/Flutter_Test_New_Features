import 'package:flutter_test/flutter_test.dart';
import 'package:testing_new_things/unit_testing/counter.dart';

void main() {
  group('Counter', () {
    test('initial value should be 0', () {
      // Arrange
      final counter = Counter();

      // Act
      //[ No action needed as we're just checking the initial value].

      // Assert
      expect(counter.value, 0);
    });

    test('increment should increase value by 1', () {
      // Arrange
      final counter = Counter();

      // Act
      counter.increment();

      // Assert
      expect(counter.value, 1);
    });

    test('Decrement should decrease the value by 1', () {
      // Arrange
      final counter = Counter();

      // Act
      counter.decrement();

      // Assert
      expect(counter.value, -1);
    });
  });
}
