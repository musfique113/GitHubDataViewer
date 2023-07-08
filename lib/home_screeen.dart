import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:githubdataviewer/repository_details_screen.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _repositories = [];
  bool _isGridView = false;
  String _filterOption = 'date';

  @override
  void initState() {
    super.initState();
    _fetchRepositories();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.view_module),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('Filter by:'),
                SizedBox(width: 16.0),
                _buildFilterOption(),
              ],
            ),
          ),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchRepositories() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.username}/repos'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _repositories = data;
      });
    }
  }

  Widget _buildFilterOption() {
    return DropdownButton<String>(
      value: _filterOption,
      onChanged: (String? value) {
        setState(() {
          _filterOption = value!;
        });
      },
      items: <String>['date', 'name', 'star'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _repositories.length,
      itemBuilder: (BuildContext context, int index) {
        final repository = _repositories[index];
        return ListTile(
          title: Text(repository['name']),
          subtitle: Text(repository['description'] ?? ''),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RepositoryDetails(repository: repository),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: _repositories.length,
      itemBuilder: (BuildContext context, int index) {
        final repository = _repositories[index];
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RepositoryDetails(repository: repository),
                ),
              );
            },
            child: Column(
              children: [
                Text(repository['name']),
                Text(repository['description'] ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

}