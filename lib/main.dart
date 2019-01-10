import 'package:flutter/material.dart';

import 'content.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ContentViewer()
          ],
        ),
      ),
    );
  }
}

class ContentViewer extends StatelessWidget {

  Widget build(BuildContext context) {
    return FutureBuilder<Content>(
      future: parse(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('content');

        final Content content = snapshot.data;
        Set<PartOfDay> pod = Set()..add(PartOfDay.afternoon);
        print('A: ${content.partOfDay}');
        print('B: $pod');
        print('C: ${pod.intersection(content.partOfDay)}');
        print('D: ${content.partOfDay.intersection(pod)}');
        return Text('data');
      }
    );
  }
}
