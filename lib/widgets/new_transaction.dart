import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: this.titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this.amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                this.addTransaction(this.titleController.text,
                    double.parse(this.amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
