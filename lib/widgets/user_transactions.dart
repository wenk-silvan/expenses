import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', amount: 69.99, timestamp: DateTime.now(), title: "New Shoes"),
    Transaction(
        id: 't2', amount: 18.55, timestamp: DateTime.now(), title: "Groceries"),
    //Transaction(
    //  id: 't3', amount: 21.11, timestamp: DateTime.now(), title: "Battery"),
  ];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      this._userTransactions.add(Transaction(
            title: title,
            timestamp: DateTime.now(),
            amount: amount,
            id: DateTime.now().toString(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(this._userTransactions),
      ],
    );
  }
}
