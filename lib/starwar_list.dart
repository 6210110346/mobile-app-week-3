import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w3/starwar_repo.dart';

class StarwarList extends StatefulWidget {
  @override
  _StarwarList createState() => _StarwarList();
}

class _StarwarList extends State<StarwarList> {
  _StarwarList() : repo = StarwarRepo();

  final StarwarRepo repo;
  late List<People> _people;
  late int _page;
  late bool _loading;
  late bool _error;

  @override
  void initState() {
    super.initState();
    _people = [];
    _page = 1;
    _loading = true;
    _error = false;
    fetchPeople();
  }

  Future<void> fetchPeople() async {
    // try {
    var _people = await repo.fetchPeople(page: _page);
    setState(() {
      _people.addAll(_people);
      _loading = false;
      _error = false;
    });
    // } catch (e) {
    //   setState(() {
    //     _loading = false;
    //     _error = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else
      return ListView.builder(
          itemCount: _people.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Text('${_people[index].id} '),
                  Text(_people[index].name),
                ],
              ),
            );
          });
  }
}
