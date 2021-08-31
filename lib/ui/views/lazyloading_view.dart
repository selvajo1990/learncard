import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncard/core/models/importdata_model.dart';
import 'package:learncard/core/services/lazyloading_service.dart';

class LazyLoadingView extends StatefulWidget {
  const LazyLoadingView({Key? key}) : super(key: key);

  @override
  _LazyLoadingViewState createState() => _LazyLoadingViewState();
}

class _LazyLoadingViewState extends State<LazyLoadingView> {
  List<EmployeeDetails> employeeList = [];
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
    _itemFetcher.getEmployeeDetail().then((List<EmployeeDetails> fetchedList) {
      employeeList.addAll(fetchedList);
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
          itemCount: employeeList.length + 1,
          itemBuilder: (context, index) {
            if (index == employeeList.length) {
              return CupertinoActivityIndicator();
            }
            return ListTile(
              leading: Text(employeeList[index].id.toString()),
              title: Text(employeeList[index].firstName),
            );
          },
        ),
      ),
    );
  }
}
