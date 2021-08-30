import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:learncard/core/services/lazyloading_service.dart';

class LazyLoadingView extends StatefulWidget {
  const LazyLoadingView({Key? key}) : super(key: key);

  @override
  _LazyLoadingViewState createState() => _LazyLoadingViewState();
}

class _LazyLoadingViewState extends State<LazyLoadingView> {
  final _pairList = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _itemFetcher = ItemFetcher();
  bool _isLoading = true;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
  }

  // Triggers fecth() and then add new items or change _hasMore flag
  void _loadMore() {
    _isLoading = true;
    _itemFetcher.fetch().then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _pairList.addAll(fetchedList);
        });
      }
    });
  }

  Widget build(BuildContext context) {
    print('reloading.........1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading'),
      ),
      body: Container(
        child: ListView.builder(
          // Need to display a loading tile if more items are coming
          itemCount: _hasMore ? _pairList.length + 1 : _pairList.length,
          itemBuilder: (BuildContext context, int index) {
            // Uncomment the following line to see in real time how ListView.builder works
            // print('ListView.builder is building index $index');
            if (index >= _pairList.length) {
              // Don't trigger if one async loading is already under way
              if (!_isLoading) {
                _loadMore();
              }
              return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 24,
                  width: 24,
                ),
              );
            }
            return ListTile(
              leading: Text(index.toString(), style: _biggerFont),
              title: Text(_pairList[index].asPascalCase, style: _biggerFont),
            );
          },
        ),
      ),
    );
  }
}
