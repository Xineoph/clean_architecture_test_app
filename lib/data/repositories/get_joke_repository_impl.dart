import 'package:ca_test_project/core/connection.dart';
import 'package:ca_test_project/core/failure.dart';
import 'package:ca_test_project/data/data_sources/joke_local_source.dart';
import 'package:ca_test_project/data/data_sources/joke_remote_source.dart';
import 'package:ca_test_project/data/models/joke_model.dart';
import 'package:ca_test_project/domain/repositories/joke_repository.dart';
import 'package:dartz/dartz.dart';

class JokesRepositoryImpl extends JokesRepository {
  final JokeLocalDataSource localDataSource;
  final JokeRemoteDataSource remoteDataSource;
  final ConnectionInfo networkInfo;

  JokesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, JokeModel>> getRandomJoke() async {
    return await makeErrorParsedCall(() async {
      if (await networkInfo.isConnected) {
        final remoteJoke =
            await remoteDataSource.getRandomJokeFromRemoteSource();
        localDataSource.saveJokeToLocalSource(remoteJoke);
        return remoteJoke;
    }
      final localJoke = await localDataSource.getRandomJokeFromLocalSource();
    return localJoke;
    });
  }
  





}
