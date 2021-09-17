import 'package:flutter/material.dart';

class HorizontalScroll extends StatelessWidget {
  final _items = List.generate(20, (e) => e);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("A"),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    print('$index');
                    return SizedBox(
                      width: 150.0,
                      child: Center(child: Text('${_items[index]}')),
                    );
                  }),
            ),
            Text("B"),
            Text("C"),
          ],
        ),
      ),
    );
  }
}
