import 'dart:convert';

List<EmployeeDetails> employeeDetails(String str) => List<EmployeeDetails>.from(
    json.decode(str).map((x) => EmployeeDetails.fromJson(x)));

class EmployeeDetails {
  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String avatar;

  EmployeeDetails({
    this.id = 0,
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.gender = "",
    this.avatar = "",
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) {
    return EmployeeDetails(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        gender: json['gender'],
        avatar: json['avatar']);
  }
}
