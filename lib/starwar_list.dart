import 'package:flutter/cupertino.dart';
import 'package:w3/starwar_repo.dart';

class StarwarList extends StatefulWidget {
  @override
  _StarwarList createState() => _StarwarList();
}

class _StarwarList extends State<StarwarList> {
  _StarwarList() : repo = StarwarRepo();

  final StarwarRepo repo;
  List<People> people = [];
  int page = 1;

  initState() {
    super.initState();
    fetchPeople();
  }

  fetchPeople() async {
    var _people = await repo.fetchPeople(page: page);
    setState(() {
      people.addAll(_people);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('hello world');
  }
}
