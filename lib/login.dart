import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:posapps/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/painting.dart';
import 'package:posapps/login.dart';

import 'createNewOrder.dart';

class Login extends StatefulWidget{
  //final Function togScreen;
  //const Login({super.key, required this.togScreen});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {

  bool isSignupScreen = true;
  bool isRememberMe = false;
  TextEditingController emailController = TextEditingController();
  bool _obscureText = true;
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0),
                Image(image: AssetImage('assets/images/pic06.png')),
                SizedBox(height: 10,),
                Text("AP Feed Mill",style: TextStyle(
                  fontSize: 30, color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 5),
                Text("Welcome to Login Page",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  height: 200,
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width -40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10,15,10,10),
                              child: TextField(
                                onChanged: (value){
                                  setState(() {
                                    username=value;
                                  });
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email or Phone",
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => emailController.clear(),
                                  ),
                                  prefixIcon: Icon(Icons.email,size: 25,
                                      color: Colors.white38),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white38
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10,20,10,10),
                              child: TextField(
                                onChanged: (value){
                                  setState(() {
                                    password = value;
                                  });
                                },
                                //controller: passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _obscureText = ! _obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                  ),
                                  prefixIcon: Icon(Icons.lock,size: 25,
                                      color: Colors.white38),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white38
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.deepOrange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    onPressed:  () {
                      _loginWithPassword(username, password);
                    },
                    child: const Text('Login',
                      style: TextStyle(fontSize: 27,),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Don't have an account?",
                //       style: TextStyle(
                //         fontSize: 18,
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () => widget.togScreen(),
                //       child: Text(
                //         " Register",
                //         style: TextStyle(
                //           color: Theme.of(context).primaryColor,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          minimumSize: Size(140, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          // Icon(
                          //   MaterialCommunityIcons.facebook,
                          // ),
                          SizedBox(width: 5,),
                          Text("Facebook"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          minimumSize: Size(140, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Colors.white,
                          backgroundColor: Colors.white38
                      ),
                      child: Row(
                        children: [
                          // Icon(
                          //   MaterialCommunityIcons.facebook,
                          // ),
                          SizedBox(width: 5,),
                          Text("Google"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('version: 1.3.2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future _loginWithPassword(String username, String password) async {
    Uri uri = Uri.parse("https://erpapi.butsbd.com/api/Auth/Login");
    final Map map = {
      'username': username,
      'password': password,
    };
    String body = json.encode(map);
    final response = await post(
      uri,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      encoding: Encoding.getByName("utf-8"),
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      Map<String, dynamic> parsedJson = res["data"];
      if(res['message'] == "Login Successful"){
        final storage = FlutterSecureStorage();
        await storage.write(key: 'jwt', value: parsedJson['accessToken']);
        Fluttertoast.showToast(
            msg: res['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewOrderList()));
      }
      else if(res['StatusCode'] == 404){
        //Toast.show("Not Fund", duration: Toast.lengthShort, gravity:  Toast.bottom);
        Fluttertoast.showToast(
            msg:res['Message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else if(res['StatusCode'] == 400){
        //Toast.show("Login Successful", duration: Toast.lengthShort, gravity:  Toast.bottom);
        Fluttertoast.showToast(
            msg:res['Message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }
}