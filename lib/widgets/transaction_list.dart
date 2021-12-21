import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text(
                  'Todavía no has hecho ningún movimiento; empiza con tu historial ya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                    height: 200.0,
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              //ctx = context
              itemBuilder: (ctx, index) {
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
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                        ),
                        //giving space to the amount box
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      //here ill show the title and the date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yy')
                                .add_jm()
                                .format(transactions[index].date),
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
              //creating a linear scroll
              itemCount: transactions.length,
            ),
    );
  }
}
