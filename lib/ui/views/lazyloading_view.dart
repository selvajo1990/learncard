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

  void _loadMore({String searchText = ""}) {
    _itemFetcher
        .getEmployeeDetail(searchText: searchText)
        .then((List<EmployeeDetails> fetchedList) {
      employeeList.addAll(fetchedList);
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                employeeList.clear();
                _loadMore(searchText: value.trim());
              },
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemExtent: 80,
                itemCount: employeeList.length + 1,
                itemBuilder: (context, index) {
                  if (employeeList.length == 0) {
                    return Center(
                      child: Text('No Record Found'),
                    );
                  }
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
          ],
        ),
      ),
    );
  }
}
