import 'package:ca_test_project/core/failure.dart';
import 'package:ca_test_project/core/usecase.dart';
import 'package:ca_test_project/domain/entity/joke_entity.dart';
import 'package:ca_test_project/domain/repositories/joke_repository.dart';
import 'package:dartz/dartz.dart';


class GetRandomJoke  extends UseCase<Joke, NoParams>{
  final JokesRepository repository;
  GetRandomJoke(this.repository);

  @override
  Future<Either<Failure, Joke>> call( NoParams params) async {
    return await repository.getRandomJoke();
  }

  
}
