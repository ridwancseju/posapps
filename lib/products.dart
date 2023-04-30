// import 'package:badges/badges.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:posapps/response_model/cartModel.dart';
// import 'package:posapps/response_model/cartProvider.dart';
// import 'package:posapps/response_model/database.dart';
// import 'package:provider/provider.dart';
//
// import 'createNewOrder.dart';
//
// class ProductsList extends StatefulWidget {
//   const ProductsList({Key? key}) : super(key: key);
//
//   @override
//   State<ProductsList> createState() => _ProductsListState();
// }
// class _ProductsListState extends State<ProductsList> {
//   DBHelper dB = DBHelper();
//   List<String> productName = ['Broiler Grower 50kg/bag', 'Broiler Starter 50kg/bag', 'Layer Layer 50kg/bag', 'Layer Starter 50kg/bag', 'Sonali Starter 50kg/bag'];
//   List<int> productPrice =[3200, 3150, 3100, 3000, 2800];
//   List<String> Discount = ['2%', '4%', '5%', '7%', '10%'];
//   List<String> productImage = [
//     'AP_broiler_starter-1.1.jpg', 'APLayer-grower-1.2.jpg', 'APSonali-feed-1.2.jpg', 'APSonali-grower-feed-1.2.jpg',
//   ];
//   //final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products List"),
//         centerTitle: true,
//         actions: [
//           Center(
//             child: Badge(
//               badgeContent: Consumer<CartProvider>(
//                 builder: (context, value, child){
//                   return Text(value.getCounter().toString(), style: const TextStyle(color: Colors.white));
//                 },
//             ),
//               child: const Icon(Icons.shopping_bag_outlined),
//           ),
//       ),
//       const SizedBox(width: 30.0,),
//       ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   itemCount: productName.length,
//                   itemBuilder: (context, index){
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 const Image(height: 150, width: 150, image: AssetImage("assets/images/APLayer-grower-1.2.jpg")),
//                                 Expanded(
//                                   child: Container(
//                                     padding: const EdgeInsets.all(5.0),
//                                     child: Column(
//                                       // mainAxisAlignment: MainAxisAlignment.start,
//                                       // crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(productName[index].toString(),
//                                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 10,),
//                                         Row(
//                                           children: [
//                                             Text("Trade Price : ${productPrice[index]}",),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 10,),
//                                         Row(
//                                           children: [
//                                             Text("Discount: ${Discount[index]}",),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 10,),
//                                         // Row(
//                                         //   children: const [
//                                         //     TextField(
//                                         //
//                                         //       decoration: InputDecoration(
//                                         //         hintText: "Qty",
//                                         //       ),
//                                         //     ),
//                                         //   ],
//                                         // ),
//                                         const SizedBox(height: 10,),
//                                         Align(
//                                           alignment: Alignment.bottomRight,
//                                           // child: InkWell(
//                                           //   onTap: (){
//                                           //     dB.insert(
//                                           //       Cart(
//                                           //         id: index,
//                                           //         productId: index.toString(),
//                                           //         productName: productName[index].toString(),
//                                           //         initialPrice: productPrice[index],
//                                           //         productPrice: productPrice[index],
//                                           //         quantity: 1,
//                                           //       )
//                                           //     ).then((value) {
//                                           //       print("Product is added to cart");
//                                           //       cart.addTotalPrice(double.parse(productPrice[index].toString()));
//                                           //       cart.addCounter();
//                                           //     }).onError((error, stackTrace){
//                                           //       print(error.toString());
//                                           //     });
//                                           //   },
//                                             child: ElevatedButton(
//
//                                               onPressed: () {
//                                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewOrderList()));
//
//                                               },
//                                               child: Container(
//                                                 height: 20, width: 70,
//                                                 decoration: BoxDecoration(
//                                                   //color: Colors.green,
//                                                   borderRadius: BorderRadius.circular(5)
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text("Add to cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                                                 ),
//                                               ),
//                                             ),
//                                          // ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }
//               ),
//           ),
//         ],
//       ),
//       // body: ListView(
//       //
//       //   children: [
//       //     buildCard(
//       //       "Broiler Grower 50kg/bag",
//       //       "Description:\n\nBroiler Grower 50kg/bag\nTP: 3200\nDiscount: 2%",
//       //     ),
//       //     buildCard("Layer Layer 50kg/bag",
//       //       "Description:\n\nLayer Layer 50kg/bag\nTP: 3000\nDiscount: 5%",
//       //     ),
//       //     buildCard("Sonali Starter 50kg/bag",
//       //       "Description:\n\nLayer Layer 50kg/bag\nTP: 2800\nDiscount: 10%",
//       //     ),
//       //   ],
//       // ),
//     );
//   }
//   // Widget buildCard(String title, String description) => Padding(
//   //   padding: const EdgeInsets.all(15),
//   //   child: Card(
//   //     elevation: 10,
//   //     margin: const EdgeInsets.all(1.0),
//   //     child: ExpandablePanel(
//   //       header: Text(
//   //         title,
//   //         style: const TextStyle(
//   //           fontWeight: FontWeight.bold,
//   //           fontSize: 25,
//   //         ),
//   //       ),
//   //       collapsed: Text(
//   //         description,
//   //         style: const TextStyle(
//   //           //fontWeight: FontWeight.bold,
//   //           fontSize: 18,
//   //         ),
//   //       ),
//   //       expanded: Text(
//   //         List.generate(0, (_) => ProductsListName).join('\n'),
//   //         style: const TextStyle(fontSize: 20,),
//   //       ),
//   //     ),
//   //   ),
//   // );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posapps/createNewOrder.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _description;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value;
                },
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: () {
                    // Save the form and validate it
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    // Save the form data and return the item to the previous activity
                    _formKey.currentState!.save();
                    final item = Item(name: _name!, description: _description!);
                    Navigator.pop(context, item);
                  },
                  child: Text("Add Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
