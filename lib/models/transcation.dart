import 'package:flutter/foundation.dart';

class Transaction {
  final String
      id; //runtime will get value, after that will never change with final keyword
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
