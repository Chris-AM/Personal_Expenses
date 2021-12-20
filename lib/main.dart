import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
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
            child: const Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
          ),
          Card(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Producto',
                    ),
                    controller: productController,
                    //onChanged: (value) {},
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Precio',
                    ),
                    controller: amountController,
                    //onChanged: (value) {},
                  ),
                  TextButton(
                    onPressed: () {
                      print(
                        'product => ${productController.text}, amountController => ${amountController.text}',
                      );
                    },
                    child: const Text('Agregar a la lista'),
                    style: TextButton.styleFrom(primary: Colors.deepPurple),
                  )
                ],
              ),
            ),
          ),
          TransactionList()
        ],
      ),
    );
  }
}
