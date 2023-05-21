import 'package:ca_test_project/ca_app.dart';
import 'package:ca_test_project/data/data_sources/local_data_const.dart';
import 'package:ca_test_project/data/models/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'injections.dart' as inject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init();
  await Hive.initFlutter();
  Hive.registerAdapter(JokeModelAdapter());
  await Hive.openBox<JokeModel>(LocalDataConst.jokesBox);
  runApp(const MyApp());
}

