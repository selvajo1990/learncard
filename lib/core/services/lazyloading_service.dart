import 'package:english_words/english_words.dart';

class ItemFetcher {
  final rowCount = 10;
  Future<List<WordPair>> fetch() async {
    final list = <WordPair>[];
    await Future.delayed(Duration(seconds: 5), () {
      for (int i = 0; i < rowCount; i++) {
        list.add(WordPair.random());
      }
    });
    return list;
  }
}
