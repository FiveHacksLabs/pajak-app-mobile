import 'package:intl/intl.dart';

class Helpers {
  static Helpers? _instance;

  Helpers._internal() {
    _instance = this;
  }

  factory Helpers() => _instance ?? Helpers._internal();

  formattedDate(String date) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);
    String formattedDate = DateFormat('d MMMM yyyy').format(parsedDate);

    return formattedDate;
  }

  convertToDateTime(String date) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);

    return parsedDate;
  }

  convertNumberToPrice(int number) {
    String formattedNumber = NumberFormat.decimalPattern('en').format(number);

    return formattedNumber;
  }

  getPercentageColors(String status) {
    if (status == "+") {
      // return ColorUtils.increaseColors;
    } else {
      // return ColorUtils.decreaseColors;
    }
  }
}
