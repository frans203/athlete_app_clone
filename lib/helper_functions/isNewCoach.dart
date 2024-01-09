bool isNewCoach(String date) {
  DateTime coachCreated = DateTime.parse(date);
  DateTime sixMonthsAgo = DateTime.now().subtract(Duration(days: 30 * 6));
  bool isOlderThanSixMonths = coachCreated.isBefore(sixMonthsAgo);
  if (!isOlderThanSixMonths) {
    return true;
  }
  return false;
}
