import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final _addTransactionHandler;

  NewTransaction(this._addTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: () {
                  _addTransactionHandler(titleController.text,
                      double.parse(amountController.text));
                },
              )
            ],
          ),
        ));
  }
}
