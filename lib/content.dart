class Content {
  Content(partOfDay) : this.partOfDay = Set()..add(partOfDay);
  final Set<PartOfDay> partOfDay;

  static Content fromJson(struct) {
    PartOfDay partOfDay = parsePartOfDay(struct['part_of_day']);
    return Content(partOfDay);
  }
}


enum PartOfDay {
  morning,
  afternoon,
  evening
}

PartOfDay parsePartOfDay(String partOfDayString) {
  switch (partOfDayString) {
    case 'morning':
      return PartOfDay.morning;
    case 'afternoon':
      return PartOfDay.afternoon;
    case 'evening':
      return PartOfDay.evening;
    default:
      throw Exception('Bad PartOfDay: <$partOfDayString>');
  }
}
