import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
                  children: [
                    Text(
                      'No transactions added yet...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover))
                  ],
                ))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                      DateFormat.yMMMEd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        ),
                ),
              );
              /*return Card(
                    child: Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                        '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactions[index].title,
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(DateFormat.yMMMEd().format(transactions[index].date),
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  )
                ]));*/
            },
            itemCount: transactions.length,
          );
  }
}
