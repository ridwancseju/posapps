import 'package:flutter/material.dart';

class BSUSuccessful extends StatelessWidget {
  const BSUSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Go back"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text("Bank Payment Slip \nSuccessfully added",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}