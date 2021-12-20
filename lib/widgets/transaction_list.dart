import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = [
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
  @override
  Widget build(BuildContext context) {
    return Column(
      //Mapping the transactions to a list of widgets
      children: _transactions.map(
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
                      DateFormat('dd/MM/yy').add_jm().format(transaction.date),
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
    );
  }
}
