import 'package:ca_test_project/core/connection.dart';
import 'package:ca_test_project/data/data_sources/joke_local_source.dart';
import 'package:ca_test_project/data/data_sources/joke_remote_source.dart';
import 'package:ca_test_project/data/repositories/get_joke_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements JokeRemoteDataSource {}

class MockLocalDataSource extends Mock implements JokeLocalDataSource {}

class MockNetworkInfo extends Mock implements ConnectionInfo {}

void main() {
  // ignore: unused_local_variable
  JokesRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = JokesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}