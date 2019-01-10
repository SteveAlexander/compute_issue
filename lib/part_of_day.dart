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
