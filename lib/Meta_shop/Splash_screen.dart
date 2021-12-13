import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purpleAccent, Colors.redAccent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: CircleAvatar(
                radius: 105,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("Images/finalMeta.jpg"),
                ),
              )),
              SizedBox(height: 10,),
              Text("Welcome to META Shop",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
          //child: Center(child: Container(height: 250,child: Image.asset("Images/MetaShop.jpg"),)),
        ),
      ),
    );
  }
}
