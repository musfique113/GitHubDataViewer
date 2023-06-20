import 'package:flutter/material.dart';
class RepositoryDetails extends StatelessWidget {
  final dynamic repository;

  RepositoryDetails({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${repository['description'] ?? 'N/A'}'),
            Text('Stars: ${repository['stargazers_count']}'),
            Text('Forks: ${repository['forks_count']}'),
            Text('Language: ${repository['language'] ?? 'N/A'}'),
            Text('Last Updated: ${repository['updated_at']}'),
          ],
        ),
      ),
    );
  }
}