import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: PersonalExpenses(),
    );
  }
}

class PersonalExpenses extends StatefulWidget {
  PersonalExpenses({Key? key}) : super(key: key);

  @override
  State<PersonalExpenses> createState() => _PersonalExpensesState();
}

class _PersonalExpensesState extends State<PersonalExpenses> {
  final List<Transaction> _transactionsList = [
    Transaction(
      id: 't1',
      title: 'Zapatos',
      amount: 59990,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Comida',
      amount: 15600,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String transactionProduct, int transactionAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: transactionProduct,
      amount: transactionAmount,
      date: DateTime.now(),
    );
    setState(() {
      _transactionsList.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //this is the chart
            Container(
              padding: const EdgeInsets.all(1.0),
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactionsList)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTransaction(context),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
