

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${this.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          this.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd()
              .format(this.transaction.timestamp),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
          textColor: Theme.of(context).errorColor,
          onPressed: () => this
              .deleteTransaction(this.transaction.id),
          icon: Icon(Icons.delete),
          label: const Text('Delete'),
        )
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => this
              .deleteTransaction(this.transaction.id),
        ),
      ),
    );
  }
}