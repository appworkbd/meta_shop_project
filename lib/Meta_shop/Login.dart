import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';
import 'Forgetpassword.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Profile.dart';
import 'Signup.dart';
import 'Viewpage.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  String user = "Soaib";

  String pass = "123456";

  getSharpref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      user = pref.getString("user_name")!;
      pass = pref.getString("password")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSharpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purpleAccent, Colors.redAccent])),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Container(
                    height: 40,
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            /*borderSide:
                                  BorderSide(color: Colors.white, width: 2)*/
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 2),
                              borderRadius: BorderRadius.circular(60)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(60)),
                          labelText: "User ID/e-mail",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          hintText: "youremail@gmail.com",
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 15)),
                      controller: usercontroller,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Container(
                    height: 40,
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            /*borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(color: Colors.white, width: 2)*/
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black38, width: 2),
                            borderRadius: BorderRadius.circular(60)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(60)),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        hintText: "12345678",
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 15),
                      ),
                      controller: passcontroller,
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgorpass()));
                      },
                      child: Text("Forgot Password",
                          style: TextStyle(color: Colors.yellow)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 40,
                    width: 120,
                    child: TextButton(
                      onPressed: () {
                        if (usercontroller.text.isEmpty &&
                            passcontroller.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter your Id & Password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP_RIGHT,
                              textColor: Colors.deepOrange);
                        } else if (usercontroller.text == user &&
                            passcontroller.text == pass) {
                          Fluttertoast.showToast(
                            msg: "Login Successful",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP_RIGHT,
                            textColor: Colors.deepOrange,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please enter your ID & Password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP_RIGHT,
                              textColor: Colors.deepOrange);
                        }
                      },
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you new here...? Please",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => profile()));
                    },
                    child: Text("Profile"),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homepage()));
                    },
                    child: Text("homepage"),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => viewPage()));*/
                    },
                    child: Text("viewPage"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //backgroundColor: Colors.white54,
    );
  }
}
