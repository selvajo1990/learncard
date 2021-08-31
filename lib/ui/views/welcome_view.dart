import 'package:flutter/material.dart';
import 'package:learncard/core/services/importdata_service.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ImportData importData = ImportData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text('Welcome'),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/DashboardView', arguments: 'hey selva');
            },
          ),
          TextButton(
            child: Text('Import Data'),
            // onPressed: () async {
            //   await importData.importEmployeeData();
            // },
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
