import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transaction_list.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.blueGrey,
        ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'OpenSands',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
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
    // Transaction(
    //   id: 't1',
    //   title: 'Zapatos',
    //   amount: 59990,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Comida',
    //   amount: 15600,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactionsList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

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
        title: const Text('Mis Gastos Personales'),
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
            Chart(_recentTransactions),
            TransactionList(_transactionsList),
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
