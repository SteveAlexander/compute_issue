import 'part_of_day.dart';

class Content {
  Content(partOfDay) : this.partOfDay = Set()..add(partOfDay);
  final Set<PartOfDay> partOfDay;

  static Content fromJson(struct) {
    PartOfDay partOfDay = parsePartOfDay(struct['part_of_day']);
    return Content(partOfDay);
  }
}

