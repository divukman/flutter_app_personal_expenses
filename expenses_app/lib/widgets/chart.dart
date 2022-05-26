import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (int i = 0; i < _recentTransactions.length; i++) {
        final Transaction tx = _recentTransactions[i];
        if (weekDay.day == tx.date.day &&
            weekDay.month == tx.date.month &&
            weekDay.year == tx.date.year) {
          totalSum += tx.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues.toString());
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ...groupedTransactionValues
              .map((data) => Text('${data['day']}: ${data['amount']}'))
              .toList()
        ],
      ),
    );
  }
}
