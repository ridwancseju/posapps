import 'dart:core';
import 'package:flutter/material.dart';
import 'package:posapps/products.dart';
import 'package:posapps/response_model/bankSlipUpload.dart';

class NewOrderList extends StatefulWidget {
  const NewOrderList({Key? key}) : super(key: key);
  @override
  State<NewOrderList> createState() => _NewOrderListState();
}
class _NewOrderListState extends State<NewOrderList> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  @override
  void initState(){
    super.initState();
    dateController.text = "";
  }
  // List <Dealer> dealerNames = <Dealer>[];
  // List <Depo> depoNames = <Depo>[];
  String? _dropdownValueDealer;
  String? _dropdownValueDepo;
  String? _dropdownValueTransport;
  String payment = "";
  final List _paymentType = ["Advance", "Cash On Delivery", "Credit"];
  //List dealerList = ["Mr. A", "Mr. B", "Mr. C", "Mr. D"];
  void dropdownDealer(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropdownValueDealer = selectedValue;
      });
    }
  }
  void dropdownDepo(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropdownValueDepo = selectedValue;
      });
    }
  }
  void dropdownTransport(String? selectedValue){
    if(selectedValue is String){
      setState(() {
        _dropdownValueTransport = selectedValue;
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
            //SELECT DEALER
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: const Text("Select Dealer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: _dropdownValueDealer,
                  onChanged: dropdownDealer,
                  iconSize: 42.0,
                  iconEnabledColor: Colors.green,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(child: Text("Mr. A", style: TextStyle(fontSize: 20),), value: "Mr. A"),
                    DropdownMenuItem(child: Text("Mr. B", style: TextStyle(fontSize: 20),), value: "Mr. B"),
                    DropdownMenuItem(child: Text("Mr. C", style: TextStyle(fontSize: 20),), value: "Mr. C"),
                    DropdownMenuItem(child: Text("Mr. D", style: TextStyle(fontSize: 20),), value: "Mr. D"),
                  ],
                ),
              ),
            ),
            //SELECT DEPO
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: const Text("Select Depo",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: _dropdownValueDepo,
                  onChanged: dropdownDepo,
                  iconSize: 42.0,
                  iconEnabledColor: Colors.green,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(child: Text("Mymensingh", style: TextStyle(fontSize: 20),), value: "Mymensingh"),
                    DropdownMenuItem(child: Text("Narsingdi", style: TextStyle(fontSize: 20),), value: "Narsingdi"),
                    DropdownMenuItem(child: Text("Dhaka", style: TextStyle(fontSize: 20),), value: "Dhaka"),
                  ],
                ),
              ),
            ),
            //SELECT PRODUCT
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: const Text("Select Product:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                Container(
                  child: FloatingActionButton.small(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductsList()));
                      },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.add,),
                  ),
                ),
              ],
            ),
              const SizedBox(height: 20,),
            const SizedBox(
              height: 50,
              // child: ListView.builder(
              //   //itemCount: ,
              //     itemBuilder: (BuildContext context, index){
              //       return Container(
              //         color: Colors.blue,
              //           child: const ProductsList());
              //     }
              // ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: const Text("Select Payment Type:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                    value: _paymentType[0],
                    groupValue: payment,
                    onChanged: (value){
                      setState(() {
                        payment = value.toString();
                      });
                    },
                ),
                const Text("Advance",style: TextStyle(fontSize: 17),),
              ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: _paymentType[1],
                      groupValue: payment,
                      onChanged: (value){
                        setState(() {
                          payment = value.toString();
                        });
                      },
                    ),
                    const Text("Cash On Delivery",style: TextStyle(fontSize: 17),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: _paymentType[2],
                      groupValue: payment,
                      onChanged: (value){
                        setState(() {
                          payment = value.toString();
                        });
                      },
                    ),
                    const Text("Cradit",style: TextStyle(fontSize: 17),),
                  ]
                ),
            //SELECT DELIVERY DATE
            const SizedBox(height: 10,),
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
            //SELECT TRANSPORT
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButton(
                  hint: const Text("Select Transport",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: _dropdownValueTransport,
                  onChanged: dropdownTransport,
                  iconSize: 42.0,
                  iconEnabledColor: Colors.green,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(child: Text("Company", style: TextStyle(fontSize: 20),), value: "Company"),
                    DropdownMenuItem(child: Text("Customer", style: TextStyle(fontSize: 20),), value: "Customer"),
                  ],
                ),
              ),
            ),
              const SizedBox(height: 20,),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BankSlip()));
                  },
                  child: const Text("Upload Bank Payment Slip",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
