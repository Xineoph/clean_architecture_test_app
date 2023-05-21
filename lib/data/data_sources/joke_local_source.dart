import 'package:ca_test_project/data/data_sources/local_data_const.dart';
import 'package:ca_test_project/data/models/joke_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class JokeLocalDataSource {
  Future<JokeModel> getRandomJokeFromLocalSource();
  void saveJokeToLocalSource(JokeModel joke);
}

class JokeLocalDataSourceImplimentation implements JokeLocalDataSource {
  JokeLocalDataSourceImplimentation();
  Box<JokeModel> jokeBox = Hive.box(LocalDataConst.jokesBox);

  @override
  Future<JokeModel> getRandomJokeFromLocalSource() async {
    JokeModel joke = jokeBox.values.last;
    return joke;
  }

  @override
  void saveJokeToLocalSource(JokeModel joke) async {
    await jokeBox.put(joke.id, joke);
  }
}
