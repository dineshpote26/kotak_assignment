import 'package:kotak_assignment/app/common/constants/strings.dart';

class Validators {
  Validators._();

  static String? validateEmpty(String? v) {
    if (v == null || v.isEmpty || (v.trim().isEmpty)) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }
}
