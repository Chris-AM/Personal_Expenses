import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Create new transaction
        NewTransaction(_addNewTransaction),
        //List of transactions done
        TransactionList(_transactionsList),
      ],
    );
  }
}
