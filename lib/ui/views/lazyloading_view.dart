import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncard/core/services/lazyloading_service.dart';

class LazyLoadingView extends StatefulWidget {
  const LazyLoadingView({Key? key}) : super(key: key);

  @override
  _LazyLoadingViewState createState() => _LazyLoadingViewState();
}

class _LazyLoadingViewState extends State<LazyLoadingView> {
  List _pairList = <WordPair>[];
  ItemFetcher _itemFetcher = ItemFetcher();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  void _loadMore() {
    _itemFetcher.fetch().then((List<WordPair> fetchedList) {
      _pairList.addAll(fetchedList);
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading'),
      ),
      body: Container(
        child: ListView.builder(
          controller: _scrollController,
          itemExtent: 80,
          itemCount: _pairList.length + 1,
          itemBuilder: (context, index) {
            if (index == _pairList.length) {
              return CupertinoActivityIndicator();
            }
            return ListTile(
              leading: Text(index.toString()),
              title: Text(_pairList[index].asPascalCase),
            );
          },
        ),
      ),
    );
  }
}
