import 'package:equatable/equatable.dart';

class Joke extends Equatable{
  final String punchline;
  final String setup;
  final String id;

  const Joke({required this.setup, required this.punchline, required this.id});

  @override
  List<Object?> get props => [
        setup,
        punchline,
        id,
      ];
}
