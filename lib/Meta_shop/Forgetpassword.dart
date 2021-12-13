import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';

class forgorpass extends StatefulWidget {
  @override
  State<forgorpass> createState() => _forgorpassState();
}

class _forgorpassState extends State<forgorpass> {

  String user= "";

  TextEditingController usernameController=TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController CofirmpasswordController = TextEditingController();

  setSharedPreference() async {
    final pref = await SharedPreferences.getInstance();

    pref.setString("password", passwordController.text);
  }

  getSharpref()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      user = pref.getString("user_name")!;
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
      appBar: AppBar(backgroundColor: Colors.purpleAccent,),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purpleAccent, Colors.redAccent])),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Column(
                  children: [
                    Center(child: Text("Recovery Password",style:
                    TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 40,),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 120,bottom: 5),
                        child: Text("E-mail address",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                      ),),
                    Center(
                      child: Container(
                        height: 40,
                        width: 250,
                        child: TextField(controller: usernameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black38, width: 2),
                                borderRadius: BorderRadius.circular(60)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(60)),
                            labelText: "Username",
                            labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                            hintText: "Enter user name",
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        height: 40,
                        width: 250,
                        child: TextField(controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
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
                            hintText: "Enter your password",
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        height: 40,
                        width: 250,
                        child: TextField(controller: CofirmpasswordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black38, width: 2),
                                borderRadius: BorderRadius.circular(60)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(60)),
                            labelText: "Confirm password",
                            labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 40,
                      width: 120,
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          if(user==usernameController.text){
                            if(passwordController.text==CofirmpasswordController.text){
                              setSharedPreference();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                            }else{Fluttertoast.showToast(msg: "Please enter valid password",
                            toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,textColor: Colors.white,fontSize: 16.0);}
                          }else{Fluttertoast.showToast(msg: "Please enter valid password",
                              toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,textColor: Colors.white,fontSize: 16.0);
                          }
                        },
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
      )
      ),
    );
  }

}
