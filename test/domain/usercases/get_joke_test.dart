import 'package:ca_test_project/core/usecase.dart';
import 'package:ca_test_project/domain/entity/joke_entity.dart';
import 'package:ca_test_project/domain/repositories/joke_repository.dart';
import 'package:ca_test_project/domain/usecases/get_random_joke.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockJokesRepository extends Mock implements JokesRepository {}

void main() {
  MockJokesRepository mockJokesRepository = MockJokesRepository();
  GetRandomJoke usecase = GetRandomJoke(mockJokesRepository);
  NoParams params = NoParams();

  const  joke =
      Joke(setup: 'Setup Text', punchline: 'Punchline Text', id: '123456');

  test(
    'should get a joke from the repository',
    () async {
      // arrange
      when(mockJokesRepository.getRandomJoke())
          .thenAnswer((_) async => const Right(joke));
      // act
      final result =  await usecase(params);
      // assert
      expect(result, const Right(joke));
      verify(mockJokesRepository.getRandomJoke());
      verifyNoMoreInteractions(mockJokesRepository);
    },
  );
}


