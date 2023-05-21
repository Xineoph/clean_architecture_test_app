

import 'dart:convert';

import 'package:ca_test_project/data/models/joke_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixstures/fixture_reader.dart';

void main() {
  final jokeModel = JokeModel(id: '123456', setup: 'Setup Text', punchline: 'Punchline Text');

  test(
    'should be a joke model',
     () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('joke.json'));
        // act
        final result = JokeModel.fromJson(jsonMap);
        // assert
        expect(result, jokeModel);
      },
  );
}