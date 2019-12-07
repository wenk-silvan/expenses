import 'dart:developer';

import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage() {
    initializeDateFormatting('de_CH', null);
    Intl.defaultLocale = 'de_CH';
  }

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', amount: 69.99, timestamp: DateTime.now(), title: "New Shoes"),
    Transaction(
        id: 't2', amount: 18.55, timestamp: DateTime.now(), title: "Groceries"),
    //Transaction(
    //  id: 't3', amount: 21.11, timestamp: DateTime.now(), title: "Battery"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart!'),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                        log("Add transaction");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                  color: Colors.grey[100],
                  elevation: 3,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.timestamp),
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      )
                    ],
                  ));
            }).toList()),
          ],
        ));
  }
}
