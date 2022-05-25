import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 101.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 22.12,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }

  void _addNewTransaction(String title, double amount) {
    final Transaction tx = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(tx);
    });
  }
}
