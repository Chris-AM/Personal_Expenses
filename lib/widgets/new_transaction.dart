import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);
  final productController = TextEditingController();
  final amountController = TextEditingController();
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
    );
  }
}
