class FormValidation {
  static String? emptyValidator(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? lengthValidator(String? value, int length, String message) {
    if (value == null || value.length < length) {
      return message;
    }
    return null;
  }

  static String? any(List<(String?, String)> values) {
    for (var value in values) {
      if (value.$1 != null) {
        return value.$2;
      }
    }
    return null;
  }
}
