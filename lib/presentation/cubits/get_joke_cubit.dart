import 'package:ca_test_project/core/failure.dart';
import 'package:ca_test_project/data/repositories/get_joke_repository_impl.dart';
import 'package:ca_test_project/helpers/strings.dart';
import 'package:ca_test_project/presentation/cubits/get_jokes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetJokesCubit extends Cubit<GetJokesState> {
  GetJokesCubit(this.getJokeRepo) : super(const GetJokesState()) {
    getJoke();
  }

  final JokesRepositoryImpl getJokeRepo;

  void getJoke() async {
    emit(state.copyWith(isLoading: true));
    final failureOrJoke = await getJokeRepo.getRandomJoke();
    failureOrJoke.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          error: _mapFailureToMessage(failure),
        ),
      ),
      (joke) => emit(
        state.copyWith(isLoading: false, joke: joke),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Strings.serverError;
      case CacheFailure:
        return Strings.cacheError;
      default:
        return Strings.unexpectedError;
    }
  }
}
