import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class DanRandoms extends StatefulWidget {
  const DanRandoms({super.key});

  @override
  State<DanRandoms> createState() => DanRandomsState();
}

class DanRandomsState extends State<DanRandoms> {
  final _danWords = <WordPair>[];
  final _savedDan = Set<WordPair>();

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
    final _alreadySaved = _savedDan.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _savedDan.remove(pair);
          } else {
            _savedDan.add(pair);
          }
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dan word')),
      body: _buildList(),
    );
  }
}
