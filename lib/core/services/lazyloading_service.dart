import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:learncard/core/models/importdata_model.dart';

class ItemFetcher {
  final rowCount = 10;
  bool _isFirst = true;
  DocumentSnapshot? lastDocument;
  final CollectionReference _employee =
      FirebaseFirestore.instance.collection('employee');
  List<EmployeeDetails> emptyEmployeeList = [];

  Future<List<WordPair>> fetch() async {
    final list = <WordPair>[];
    await Future.delayed(Duration(seconds: 5), () {
      for (int i = 0; i < rowCount; i++) {
        list.add(WordPair.random());
      }
    });
    return list;
  }

  Future<List<EmployeeDetails>> getEmployeeDetail() async {
    try {
      QuerySnapshot querySnapshot;
      if (_isFirst) {
        querySnapshot = await _employee.orderBy("id").limit(10).get();
        lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
        _isFirst = false;
      } else {
        Map mapData = lastDocument?.data() as Map;
        if (mapData.isEmpty) {
          return emptyEmployeeList;
        }
        querySnapshot = await _employee
            .orderBy("id")
            .startAfter([mapData['id']])
            .limit(10)
            .get();
        lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
      }

      return querySnapshot.docs
          .map((data) => EmployeeDetails(
              id: data['id'],
              firstName: data['firstName'],
              lastName: data['lastName'],
              email: data['email'],
              gender: data['gender'],
              avatar: data['avatar']))
          .toList();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
