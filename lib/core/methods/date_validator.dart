class DateValidator {
  static String? validateBirhtDate(DateTime date) {
    final now = DateTime.now();
    final age = now.year - date.year;
    final isBirthdayPassed = now.month > date.month ||
        (now.month == date.month && now.day >= date.day);
    final isAdult = age > 18 || (age == 18 && isBirthdayPassed);
    if (!isAdult) {
      return "Debes ser mayor de edad.";
    }
    return null;
  }

  static String? validateDateSelection(DateTime date) {
    return null;
  }
}
