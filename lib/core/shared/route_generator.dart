import 'package:flutter/material.dart';
import 'package:learncard/ui/views/dashboard_view.dart';
import 'package:learncard/ui/views/lazyloading_view.dart';
import 'package:learncard/ui/views/welcome_view.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LazyLoadingView());
      case '/DashboardView':
        if (arguments is String) {
          return MaterialPageRoute(
              builder: (_) => DashboardView(
                    sampledata: arguments,
                  ));
        } else {
          return _errorPage();
        }
    }
    return _errorPage();
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Screen'),
        ),
        body: Center(
          child: Text('Sorry page not found'),
        ),
      );
    });
  }
}
