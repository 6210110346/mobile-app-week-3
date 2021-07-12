import 'package:dio/dio.dart';

class People {
  final String name;
  People(this.name);

  factory People.fromJson(json) {
    return People(json['name']);
  }
}

class StarwarRepo {
  Future<List<People>> fetchPeople({required int page}) async {
    var response = await Dio().get('https://swapi.dev/api/people/?page=$page');
    var results = response.data['results'] as List;
    return results.map((data) => People.fromJson(data)).toList();
  }
}
