import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final _addTransactionHandler;

  NewTransaction(this._addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

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
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: submitData,
              )
            ],
          ),
        ));
  }

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (!title.isEmpty && amount > 0) {
      widget._addTransactionHandler(title, amount);
      Navigator.of(context).pop();
    }
  }
}
