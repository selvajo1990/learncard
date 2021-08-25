import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Welcome'),
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/DashboardView', arguments: 'hey selva');
          },
        ),
      ),
    );
  }
}
