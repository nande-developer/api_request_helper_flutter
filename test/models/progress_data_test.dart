import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProgressData', () {
    test('calculates percentage correctly', () {
      const progress = ProgressData(count: 50, total: 100);

      expect(progress.percentage, equals(0.5));
      expect(progress.percentageInt, equals(50));
    });

    test('handles zero total', () {
      const progress = ProgressData(count: 0, total: 0);

      expect(progress.percentage, equals(0.0));
      expect(progress.percentageInt, equals(0));
    });

    test('isComplete returns true when count equals total', () {
      const progress = ProgressData(count: 100, total: 100);

      expect(progress.isComplete, isTrue);
    });

    test('isComplete returns false when count less than total', () {
      const progress = ProgressData(count: 50, total: 100);

      expect(progress.isComplete, isFalse);
    });

    test('isComplete returns true when count exceeds total', () {
      const progress = ProgressData(count: 101, total: 100);

      expect(progress.isComplete, isTrue);
    });

    test('isComplete returns false when total is zero', () {
      const progress = ProgressData(count: 10, total: 0);

      expect(progress.isComplete, isFalse);
    });

    test('percentageInt rounds correctly', () {
      const progress1 = ProgressData(count: 333, total: 1000);
      expect(progress1.percentageInt, equals(33));

      const progress2 = ProgressData(count: 666, total: 1000);
      expect(progress2.percentageInt, equals(67));

      const progress3 = ProgressData(count: 999, total: 1000);
      expect(progress3.percentageInt, equals(100));
    });
  });
}
