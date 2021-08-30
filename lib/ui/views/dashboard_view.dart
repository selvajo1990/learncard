import 'package:flutter/material.dart';
import 'package:learncard/ui/shared/size_helper.dart';
import 'package:learncard/ui/widgets/dashboard_card.dart';
import 'package:learncard/core/services/dashboard_service.dart';

class DashboardView extends StatelessWidget {
  final String sampledata;
  const DashboardView({
    Key? key,
    this.sampledata = "",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DashboardService dashboardService = DashboardService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - ' + sampledata),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              FutureBuilder(
                future: dashboardService.getEmployee(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(displayHeight(context) * 0.01),
                          height: displayHeight(context) * 0.30,
                          width: displayWidth(context) * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.redAccent,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.deepPurple),
                                strokeWidth: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return Row(
                      children: dashboardSummaryList(snapshot),
                    );
                  } else if (snapshot.hasError) {
                    final error = snapshot.error;
                    return Container(
                      margin: EdgeInsets.all(displayHeight(context) * 0.01),
                      height: displayHeight(context) * 0.30,
                      width: displayWidth(context) * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(error.toString()),
                        ],
                      ),
                    );
                  } else {
                    return Text('data');
                  }
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
