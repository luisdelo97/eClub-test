import 'package:intl/intl.dart';

String formatNumber(double value) {
  final formatter = NumberFormat.decimalPattern('es');
  return formatter.format(value);
}

String formatDate(DateTime date) {
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

String formatTime(DateTime date) {
  final formatter = DateFormat('HH:mm a');
  return formatter.format(date);
}
