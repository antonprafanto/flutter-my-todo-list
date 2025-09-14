// Template Code - Tahap 1 Complete
// Salin kode ini jika kamu stuck di Tahap 1

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Pemula',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Coming Soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

/*
✅ Expected Result Tahap 1:
- App bisa running tanpa error
- AppBar biru dengan text "My To-Do List"
- Body putih dengan text "Coming Soon!" di tengah
- Hot reload works

🔗 Next: tutorial/tahap2/README.md
*/