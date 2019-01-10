import 'dart:convert' show jsonDecode;

import 'package:flutter/foundation.dart' show compute;

import 'content.dart';

Future<Content> parse() async {
  String json = '{"part_of_day": "afternoon"}';

  return await compute<String, Content>(_parse, json);
}

Content _parse(String json) {
  final dynamic struct = jsonDecode(json);
  return Content.fromJson(struct);
}
