import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final danWord = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dany Randoms'),
        ),
        body: Center(
          child: Text(
            danWord.asPascalCase,
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
