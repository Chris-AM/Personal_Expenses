import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/transaction.dart';

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

  final List<Transaction> transactions = [
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
          Column(
            //Mapping the transactions to a list of widgets
            children: transactions.map(
              (transaction) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      //here ill show the amount
                      Container(
                        //separing the amount from the rest of the card
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        //styling the amount box
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                        //giving space to the amount box
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transaction.amount}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                      //here ill show the title and the date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yy')
                                .add_jm()
                                .format(transaction.date),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
