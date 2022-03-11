import 'package:flutter/material.dart';
import '../models/transcation.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transaction, this.deleteTransaction);
  final List<Transaction> transaction;
  final Function deleteTransaction;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return transaction.isEmpty
          ? Column(
              children: [
                Text("No transaction added"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraint.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                final Transaction transactionObj = transaction[index];
                return TransactionItem(
                    key: ValueKey(transactionObj.id),
                    transaction: transactionObj,
                    deleteTransaction: deleteTransaction);
              },
              itemCount: transaction.length,
            );
    });
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                ),
              ),
            ),
          ),
          title:
              Text(transaction.title, style: Theme.of(context).textTheme.title),
          subtitle: Text(
            DateFormat.yMMMMd().format(transaction.date),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteTransaction(transaction.id);
            },
          ),
        ),
      ),
    );
  }
}
