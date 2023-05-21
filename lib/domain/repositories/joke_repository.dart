import 'package:ca_test_project/core/exeption.dart';
import 'package:ca_test_project/core/failure.dart';
import 'package:ca_test_project/domain/entity/joke_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class JokesRepository {
  Future<Either<Failure, Joke>> getRandomJoke();

  Future<Either<Failure, T>> makeErrorParsedCall<T>(
    AsyncValueGetter<T> callback,
  ) async {
    try {
      return Right(await callback());
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

