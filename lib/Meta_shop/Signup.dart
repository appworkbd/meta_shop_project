import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  DateTime? _dateTime;
  int radiovalue = 0;

  getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 2));
    setState(() {
      _dateTime = date;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
                  height: 5,
                ),
                Text(
                  "Sign up now",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 140,
                      //color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            hintText: "First name",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 35,
                      width: 140,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            hintText: "Last name",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        //labelText: "First name",
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "e-mail",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "Create password",
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: 35,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                            child: _dateTime == null
                                ? Text(
                                    "Date: DD-MM-YYYY",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "Date: ${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}")),
                        SizedBox(
                          width: 121,
                        ),
                        IconButton(
                            onPressed: () {
                              getDate();
                            },
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ))
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //SizedBox(width: 30,),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: radiovalue,
                            onChanged: (value) {
                              setState(() {
                                radiovalue = value as int;
                              });
                            }),
                        Text("Male"),
                      ],
                    ),
                    //SizedBox(width: 150,),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: radiovalue,
                            onChanged: (value) {
                              setState(() {
                                radiovalue = value as int;
                              });
                            }),
                        Text("Female"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 3,
                            groupValue: radiovalue,
                            onChanged: (value) {
                              setState(() {
                                radiovalue = value as int;
                              });
                            }),
                        Text("Others")
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: radiovalue.toString(),
                                  toastLength: Toast.LENGTH_LONG);
                            },
                            child: Text("Submit"))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Accept all Terms & Conditions",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 120,
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                      setSharedPreference();
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context)=>()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  setSharedPreference() async {
    final pref = await SharedPreferences.getInstance();

    pref.setString("user_name", emailController.text);
    pref.setString("password", passController.text);
  }
}
