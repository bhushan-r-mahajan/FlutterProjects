import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final wordPair = <WordPair>[];
  final savedWordPairs = Set<WordPair>();

  Widget buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();
        final index = item ~/ 2;
        if (index >= wordPair.length) {
          wordPair.addAll(generateWordPairs().take(10));
        }
        return buildRow(wordPair[index]);
      },
    );
  }

  Widget buildRow(WordPair pair) {
    final alreadySaved = savedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: const TextStyle(fontSize: 18)),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedWordPairs.remove(pair);
          } else {
            savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void showSavedWords() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = savedWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(
          pair.asPascalCase,
          style: const TextStyle(fontSize: 18),
        ));
      });
      final List<Widget> divided = ListTile.divideTiles(
        tiles: tiles,
        context: context,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: const Text("Saved Word Pairs"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word Pair Generator"),
        actions: [
          IconButton(onPressed: showSavedWords, icon: Icon(Icons.list))
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[600],
      ),
      body: Center(
        child: buildListView(),
      ),
    );
  }
}
