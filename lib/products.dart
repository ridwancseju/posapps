import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}
class _ProductsListState extends State<ProductsList> {
  static const ProductsListName = 'Broiler Grower 50kg/';

  //final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ListView(
        children: [
          buildCard(
            "Broiler Grower 50kg/bag",
            "Description:\n\nBroiler Grower 50kg/bag\nTP: 3200\nDiscount: 2%",
          ),
        ],
      ),
    );
  }
  Widget buildCard(String title, String description) => Padding(
    padding: const EdgeInsets.all(15),
    child: Card(
      child: ExpandablePanel(
        header: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        collapsed: Text(
          description,
          style: const TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        expanded: Text(
          List.generate(0, (_) => ProductsListName).join('\n\n'),
          style: const TextStyle(fontSize: 20,),
        ),
      ),
    ),
  );
}
