// ignore_for_file: must_be_immutable

import 'package:hive_flutter/hive_flutter.dart';

import 'package:ca_test_project/domain/entity/joke_entity.dart';

part 'joke_model.g.dart';

@HiveType(typeId: 0)
class JokeModel extends HiveObject implements  Joke {
  @override
  @HiveField(0)
  final String punchline;
  @override
  @HiveField(1)
  final String setup;
  @override
  @HiveField(2)
  final String id;

  JokeModel({required this.setup, required this.punchline, required this.id});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['body'][0]['_id'] ?? '',
      setup: json['body'][0]['setup'] ?? '',
      punchline: json['body'][0]['punchline'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        setup,
        punchline,
        id,
      ];

  JokeModel copyWith({
    String? punchline,
    String? setup,
    String? id,
  }) =>
      JokeModel(
        id: id ?? this.id,
        punchline: punchline ?? this.punchline,
        setup: setup ?? this.setup,
      );

  @override
  bool? get stringify => throw UnimplementedError();
}
