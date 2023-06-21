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
              Text(
                'Description: ${repository['description'] ?? 'N/A'}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Stars: ${repository['stargazers_count']}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Forks: ${repository['forks_count']}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Language: ${repository['language'] ?? 'N/A'}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Last Updated: ${repository['updated_at']}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),

      ),
    );
  }
}