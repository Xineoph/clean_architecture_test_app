import 'package:ca_test_project/core/connection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

class MockDataConnection extends Mock implements InternetConnectionChecker {}

void main() {
  MockDataConnection mockDataConnection = MockDataConnection();
  ConnectionInfoImpl networkInfo = ConnectionInfoImpl(mockDataConnection);

  ;

  group('isConnected', () {
    test(
      'check connection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(networkInfo.isConnected)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        final result = networkInfo.isConnected;
        // assert
        verify(networkInfo.isConnected);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
