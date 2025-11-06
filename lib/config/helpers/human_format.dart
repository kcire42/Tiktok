//install intl package before using this code
import 'package:intl/intl.dart';

class HumanFormat {
  static String humanReadableNumber(double number){
    if (number < 0) return '';
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}