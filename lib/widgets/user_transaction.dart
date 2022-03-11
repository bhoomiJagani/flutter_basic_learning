import '/models/transcation.dart';

import '/widgets/input_transaction.dart';
import '/widgets/trascation_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // InputTransaction(
        //   addTransaction: _addTransaction,
        // ),
        // TransactionList(transaction)
      ],
    );
  }
}
