import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:learncard/core/models/importdata_model.dart';

class ImportData {
  final CollectionReference _employee =
      FirebaseFirestore.instance.collection('employee');
  Future importEmployeeData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://mocki.io/v1/27f65e01-234c-420f-828e-72a6af53c399'));
      if (response.statusCode == 200) {
        List<EmployeeDetails> employeeList = employeeDetails(response.body);
        for (var i = 0; i < employeeList.length; i++) {
          _employee.add({
            "id": employeeList[i].id,
            "firstName": employeeList[i].firstName,
            "lastName": employeeList[i].lastName,
            "email": employeeList[i].email,
            "avatar": employeeList[i].avatar,
            "gender": employeeList[i].gender
          }).then((value) => print("$value - inserted"));
        }
        return employeeList;
      } else {
        return <EmployeeDetails>[];
      }
    } catch (error) {
      throw error;
    }
  }
}
