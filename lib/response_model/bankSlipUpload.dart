import 'package:posapps/main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:convert';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:posapps/response_model/bSUSuccessfully.dart';
class BankSlip extends StatefulWidget {
  const BankSlip({Key? key}) : super(key: key);

  @override
  State<BankSlip> createState() => _BankSlipState();
}

class _BankSlipState extends State<BankSlip> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if(pickedFile!=null){
      image = File(pickedFile.path);
      setState(() {

      });
    }else{
      print('No image selected');
    }
  }
  Future<void> uploadImage() async{
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://farmvisitnew.butsbd.com/api/Files/MultipleFile');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = "Static title";
    var multiport = http.MultipartFile(
        'image',
        stream,
        length);
    request.files.add(multiport);
    var response = await request.send();
      print(response.stream.toString());

    if(response.statusCode == 200){
      setState(() {
        showSpinner = false;
      });
      print('image uploaded');
    }else{
      print('uploaded fail');
      setState(() {
        showSpinner = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Picture Upload"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  getImage();
                  //getImageCamera();
                } ,
                child: Container(
                  child: image == null ?
                  const Center(
                    child: Icon(Icons.camera, color: Colors.deepOrange,size: 60,),
                  )
                      : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 450,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.deepOrange,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  onPressed:  () {
                    uploadImage();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BSUSuccessful()));
                  },
                  child: const Text('Upload',
                    style: TextStyle(fontSize: 25,),
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
