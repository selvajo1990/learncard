import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:learncard/core/models/dashboard_model.dart';

class DashboardService {
  final CollectionReference _employee =
      FirebaseFirestore.instance.collection('employee');
  final CollectionReference _employer =
      FirebaseFirestore.instance.collection('employer');

  Future<List<DashboardModel>> getEmployee() async {
    try {
      List<DashboardModel> list = [];
      QuerySnapshot querySnapshotEmployee = await _employee.get();
      list.add(DashboardModel.dashboardCardDetails(
          tableName: "Employee Table", totalCount: querySnapshotEmployee.size));

      QuerySnapshot querySnapshotEmployer = await _employer.get();
      list.add(DashboardModel.dashboardCardDetails(
          tableName: "Employer Table", totalCount: querySnapshotEmployer.size));
      return list;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  // Future getEmployee() async {
  //   try {
  //     return await _employee.doc('OtSAW4EWeAYBeFYvzWJB').get();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}

// Future getDashboardCardSummary() async {
//   List<DashboardCardSummary> dashboardCardSummaryList =
//       await preparedashboardCardSummaryList();
// }

// List<DashboardCardSummary> preparedashboardCardSummaryList {
//   return DashboardCardSummary(totalCount: 1);
// }

// https://medium.com/mellow-code-labs/future-builders-along-with-listview-builders-in-your-flutter-app-6656976edeb7
Future getAllTodos() async {
  try {
    var response = await http.get(
        Uri.parse('https://mocki.io/v1/b8b39053-dc1f-47ab-899e-bad95598f9c8'));
    return json.decode(response.body);
  } catch (error) {
    throw error;
  }
}
