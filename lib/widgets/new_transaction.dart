import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    this.addTransaction(
        enteredTitle,
        enteredAmount
    );
  }

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
              onSubmitted: (_) => this.submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this.amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => this.submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: this.submitData,
            ),
          ],
        ),
      ),
    );
  }
}
