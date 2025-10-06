import 'package:api_request_helper_flutter/api_request_helper_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransferStatus', () {
    test('creates idle status', () {
      const status = TransferStatus.idle();

      expect(status, isA<TransferStatus>());
      status.when(
        idle: () => null,
        inProgress: (_) => fail('Should be idle'),
        completed: () => fail('Should be idle'),
        failed: (_) => fail('Should be idle'),
        cancelled: () => fail('Should be idle'),
      );
    });

    test('creates inProgress status', () {
      const progress = ProgressData(count: 50, total: 100);
      const status = TransferStatus.inProgress(progress);

      expect(status, isA<TransferStatus>());
      status.when(
        idle: () => fail('Should be inProgress'),
        inProgress: (p) {
          expect(p, equals(progress));
        },
        completed: () => fail('Should be inProgress'),
        failed: (_) => fail('Should be inProgress'),
        cancelled: () => fail('Should be inProgress'),
      );
    });

    test('creates completed status', () {
      const status = TransferStatus.completed();

      expect(status, isA<TransferStatus>());
      status.when(
        idle: () => fail('Should be completed'),
        inProgress: (_) => fail('Should be completed'),
        completed: () => null,
        failed: (_) => fail('Should be completed'),
        cancelled: () => fail('Should be completed'),
      );
    });

    test('creates failed status', () {
      const errorMessage = 'Download failed';
      const status = TransferStatus.failed(errorMessage);

      expect(status, isA<TransferStatus>());
      status.when(
        idle: () => fail('Should be failed'),
        inProgress: (_) => fail('Should be failed'),
        completed: () => fail('Should be failed'),
        failed: (error) {
          expect(error, equals(errorMessage));
        },
        cancelled: () => fail('Should be failed'),
      );
    });

    test('creates cancelled status', () {
      const status = TransferStatus.cancelled();

      expect(status, isA<TransferStatus>());
      status.when(
        idle: () => fail('Should be cancelled'),
        inProgress: (_) => fail('Should be cancelled'),
        completed: () => fail('Should be cancelled'),
        failed: (_) => fail('Should be cancelled'),
        cancelled: () => null,
      );
    });
  });
}
