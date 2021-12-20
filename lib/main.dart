import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

import './models/transaction.dart';

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

class PersonalExpenses extends StatelessWidget {
  PersonalExpenses({Key? key}) : super(key: key);

  final List<Transaction> transactions = [];

  final productController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           Container(
            width: double.infinity,
            child:  Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
