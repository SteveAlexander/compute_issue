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
