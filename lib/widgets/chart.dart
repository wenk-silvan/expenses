import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < this.recentTransactions.length; i++) {
        if (this.recentTransactions[i].timestamp.day == weekDay.day &&
            this.recentTransactions[i].timestamp.month == weekDay.month &&
            this.recentTransactions[i].timestamp.year == weekDay.year) {
          totalSum += this.recentTransactions[i].amount;
        }
      }

      print(this.recentTransactions);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return this.groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: this.groupedTransactionValues.map((v) {
            return Expanded(
              child: ChartBar(
                v['day'],
                v['amount'],
                this.totalSpending == 0.0
                    ? 0.0
                    : (v['amount'] as double) / this.totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
