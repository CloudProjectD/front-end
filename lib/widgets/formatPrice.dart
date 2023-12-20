import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat('#,###');
  return formatter.format(price);
}