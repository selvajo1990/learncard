import 'package:flutter/material.dart';
import 'package:learncard/ui/widgets/dashboard_card.dart';
import 'package:learncard/core/services/dashboard_service.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DashboardService dashboardService = DashboardService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              FutureBuilder(
                future: dashboardService.getEmployee(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.active &&
                      !snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Row(
                      children: dashboardSummaryList(snapshot),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> dashboardSummaryList(AsyncSnapshot snapshot) {
  List<Widget> list = [];
  int i = 0;
  for (i = 0; i < snapshot.data.length; i++) {
    list.add(DashboardDetailCard(flavor: snapshot.data[i].tableName));
  }
  return list;
}