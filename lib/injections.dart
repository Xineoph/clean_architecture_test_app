import 'package:ca_test_project/core/connection.dart';
import 'package:ca_test_project/data/data_sources/joke_local_source.dart';
import 'package:ca_test_project/data/data_sources/joke_remote_source.dart';
import 'package:ca_test_project/data/repositories/get_joke_repository_impl.dart';
import 'package:ca_test_project/domain/usecases/get_random_joke.dart';
import 'package:ca_test_project/presentation/cubits/get_joke_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final inject = GetIt.instance;

Future<void> init() async {
  inject.registerLazySingleton(() => GetRandomJoke(inject()));

  inject.registerLazySingleton(() => InternetConnectionChecker());
  inject.registerLazySingleton<ConnectionInfo>(
      () => ConnectionInfoImpl(inject()));

  inject.registerLazySingleton<JokesRepositoryImpl>(
    () => JokesRepositoryImpl(
      localDataSource: inject(),
      networkInfo: inject(),
      remoteDataSource: inject(),
    ),
  );

  inject.registerLazySingleton<JokeRemoteDataSource>(
    () => JokeRemoteDataSourceImplimentation(inject()),
  );

  inject.registerLazySingleton<JokeLocalDataSource>(
    () => JokeLocalDataSourceImplimentation(),
  );

  inject.registerFactory(
    () => GetJokesCubit(inject()),
  );

  inject.registerLazySingleton(() => http.Client());
}
