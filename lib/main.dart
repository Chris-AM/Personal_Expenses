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
            const UserTransaction(),
          ],
        ),
      ),
    );
  }
}
