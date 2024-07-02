import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]), home: DanRandoms());
  }
}

class DanRandoms extends StatefulWidget {
  const DanRandoms({super.key});

  @override
  State<DanRandoms> createState() => DanRandomsState();
}

class DanRandomsState extends State<DanRandoms> {
  final _danWords = <WordPair>[];
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;

          if (index >= _danWords.length) {
            _danWords.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_danWords[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text("HI"),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dan word')),
      body: _buildList(),
    );
  }
}
