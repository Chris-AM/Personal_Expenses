import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final productController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final productAdded = productController.text;
    final amountAdded = int.parse(amountController.text);
    if (productAdded.isEmpty || amountAdded <= 0) {
      return;
    }
    widget.addTransaction(
      productAdded,
      amountAdded,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) {},
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Precio',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) {},
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Agregar a la lista'),
              style: TextButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
    );
  }
}
