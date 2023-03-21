import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}
class _ProductsListState extends State<ProductsList> {
  List<String> productName = ['Broiler Grower 50kg/bag', 'Layer Layer 50kg/bag', 'Sonali Starter 50kg/bag'];
  List<int> TP =[3200, 3100, 3000];
  List<String> Discount = ['2%', '5%', '10%'];
  List<String> productImage = [
    'AP_broiler_starter-1.1.jpg', 'APLayer-grower-1.2.jpg', 'APSonali-feed-1.2.jpg', 'APSonali-grower-feed-1.2.jpg',
  ];

  //final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
        centerTitle: true,
        actions: const [
          Center(
            child: Badge(
              badgeContent: Text("0", style: TextStyle(color: Colors.white),),
            ),
          ),
          Icon(Icons.shopping_bag_outlined),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Image(height: 150, width: 150, image: AssetImage("assets/images/APLayer-grower-1.2.jpg")),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productName[index].toString(),
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text("Trade Price : " + TP[index].toString(),),
                                        const SizedBox(height: 10,),
                                        Text("Discount: " + Discount[index].toString(),),
                                        const SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: 30, width: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Center(
                                              child: Text("Add to cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
          ),
        ],
      ),

      // body: ListView(
      //
      //   children: [
      //     buildCard(
      //       "Broiler Grower 50kg/bag",
      //       "Description:\n\nBroiler Grower 50kg/bag\nTP: 3200\nDiscount: 2%",
      //     ),
      //     buildCard("Layer Layer 50kg/bag",
      //       "Description:\n\nLayer Layer 50kg/bag\nTP: 3000\nDiscount: 5%",
      //     ),
      //     buildCard("Sonali Starter 50kg/bag",
      //       "Description:\n\nLayer Layer 50kg/bag\nTP: 2800\nDiscount: 10%",
      //     ),
      //   ],
      // ),
    );
  }
  // Widget buildCard(String title, String description) => Padding(
  //   padding: const EdgeInsets.all(15),
  //   child: Card(
  //     elevation: 10,
  //     margin: const EdgeInsets.all(1.0),
  //     child: ExpandablePanel(
  //       header: Text(
  //         title,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 25,
  //         ),
  //       ),
  //       collapsed: Text(
  //         description,
  //         style: const TextStyle(
  //           //fontWeight: FontWeight.bold,
  //           fontSize: 18,
  //         ),
  //       ),
  //       expanded: Text(
  //         List.generate(0, (_) => ProductsListName).join('\n'),
  //         style: const TextStyle(fontSize: 20,),
  //       ),
  //     ),
  //   ),
  // );
}
