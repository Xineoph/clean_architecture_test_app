import 'package:ca_test_project/data/models/joke_model.dart';
import 'package:equatable/equatable.dart';

class GetJokesState extends Equatable {
  final JokeModel? joke;
  final bool? isLoading;
  final String? error;

  const GetJokesState({
    this.joke,
    this.isLoading,
    this.error,
  });

  GetJokesState copyWith({
    JokeModel? joke,
    bool? isLoading,
    String? error,
  }) =>
      GetJokesState(
        joke: joke ?? this.joke,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        joke,
        isLoading,
        error,
      ];
}
