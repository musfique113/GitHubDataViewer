import 'package:flutter/material.dart';
import 'package:githubdataviewer/home_screeen.dart';

class MainScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  final TextEditingController _usernameController = TextEditingController();

  MainScreen({
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Explorer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Enter GitHub username',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Theme'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    toggleTheme();
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
