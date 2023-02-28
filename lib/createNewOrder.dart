import 'dart:core';
import 'package:flutter/material.dart';
import 'package:posapps/products.dart';
import 'package:posapps/response_model/dealerName.dart';
import 'package:posapps/response_model/Depo.dart';
class NewOrderList extends StatefulWidget {
  const NewOrderList({Key? key}) : super(key: key);

  @override
  State<NewOrderList> createState() => _NewOrderListState();
}

class _NewOrderListState extends State<NewOrderList> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  void initState(){
    super.initState();
    dateController.text = "";
  }
  List <Dealer> dealerNames = <Dealer>[];
  List <Depo> depoNames = <Depo>[];
  String? _dropdownValue;
  //List dealerList = ["Mr. A", "Mr. B", "Mr. C", "Mr. D"];
  void dropdownCallback(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Order"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20,10,20,10),
          child: Column(
          children: [
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: Text("Select Dealer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: _dropdownValue,
                  onChanged: dropdownCallback,
                  iconSize: 42.0,
                  iconEnabledColor: Colors.green,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: const [
                    DropdownMenuItem(child: Text("Mr. A", style: TextStyle(fontSize: 20),), value: "Mr. A"),
                    DropdownMenuItem(child: Text("Mr. B", style: TextStyle(fontSize: 20),), value: "Mr. B"),
                    DropdownMenuItem(child: Text("Mr. C", style: TextStyle(fontSize: 20),), value: "Mr. C"),
                    DropdownMenuItem(child: Text("Mr. D", style: TextStyle(fontSize: 20),), value: "Mr. D"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                    child: const Text("Select Product:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                Container(
                  child: FloatingActionButton.small(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductsList()));
                      },
                    child: const Icon(Icons.add,),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              child: Center(
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                    //icon: Icon(Icons.calendar_today),
                    labelText: "Select Delivery Date",
                    labelStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  readOnly: true,
                  onTap: () async{
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    );
                    if(pickedDate!=null){
                      DateTime now = DateTime.now();
                      String formattedDate = "${now.day.toString().padLeft(2,'0')}-${now.month.toString().padLeft(2,'0')}-${now.year.toString()}  ${now.hour.toString().padLeft(2,'0')} : ${now.minute.toString().padLeft(2,'0')}";
                      setState(() {
                        dateController.text = formattedDate.toString();
                        //visitingDate = formattedDate.toString();
                      });
                    }else{
                      print("Not Selected");
                    }
                    },
                ),
             ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
