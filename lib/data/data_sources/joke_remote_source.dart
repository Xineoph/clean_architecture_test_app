import 'package:ca_test_project/core/exeption.dart';
import 'package:ca_test_project/data/data_sources/remote_data_const.dart';
import 'package:ca_test_project/data/models/joke_model.dart';
import 'dart:convert';
import 'package:http/http.dart';

abstract class JokeRemoteDataSource {
  Future<JokeModel> getRandomJokeFromRemoteSource();
}

class JokeRemoteDataSourceImplimentation implements JokeRemoteDataSource {
  final Client client;

  JokeRemoteDataSourceImplimentation(this.client);

  @override
  Future<JokeModel> getRandomJokeFromRemoteSource() async {
    final response = await client.get(
      Uri.parse(RemoteDataConst.endPointUrl),
      headers: RemoteDataConst.headers,
    );
    if (response.statusCode != 200) throw ServerException();
    final decoded = json.decode(response.body);
    return JokeModel.fromJson(decoded);
  }
}
