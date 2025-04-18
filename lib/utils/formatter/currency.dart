import 'package:intl/intl.dart';

extension FormatCurrency on num {
  String get formatCurrency {
    var formatter = NumberFormat('#,###,###');
    var t = NumberFormat.currency(locale: "vi");
    return "${formatter.format(this)} ${t.currencySymbol}";
  }
}
