class People {
  final String name;
  People(this.name);

  factory People.fromJson(json) {
    return People(json['name']);
  }
}

class StarwarRepo {}
