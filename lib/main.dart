import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show compute;

Future<Content> parse() async {
  return await compute<String, Content>(_parse, null);
}

Content _parse(String json) {
  return Content(PartOfDay.afternoon);
}

class Content {
  Content(partOfDay) : this.partOfDay = Set()..add(partOfDay);
  final Set<PartOfDay> partOfDay;
}

enum PartOfDay {
  morning,
  afternoon,
  evening
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => 
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: ContentViewer()
        )
      );
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
