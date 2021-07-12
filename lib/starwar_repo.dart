import 'package:dio/dio.dart';

class People {
  final String id;
  final String name;
  People(this.id, this.name);

  factory People.fromJson(json) {
    var id = json['url']
        .split('https://swapi.dev/api/people/')
        .last
        .split('/')
        .first;

    return People(id, json['name']);
  }
}

class StarwarRepo {
  Future<List<People>> fetchPeople({required int page}) async {
    var response = await Dio().get('https://swapi.dev/api/people/?page=$page');
    var results = response.data['results'] as List;
    return results.map((data) => People.fromJson(data)).toList();
  }
}
