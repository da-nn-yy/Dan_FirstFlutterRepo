import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

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

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _danWords.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 16.0),
          ),
        );
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Save Dan words"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dan word'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildList(),
    );
  }
}
