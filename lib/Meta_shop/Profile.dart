import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String email="";
  String pass="";

  File? imageFile;

  getSharpref()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString("user_name")!;
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
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purpleAccent, Colors.redAccent])
            ),
            child: Center(
              child: Column(
                children: [
                  Text("Profile Page Design",style:
                  TextStyle(color: Colors.white,fontSize: 36),),
                  Text("Email id : $email"),
                  Text("Password:$pass"),

                  /*CircleAvatar(
                    radius: 50,
                    child: IconButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return Dialog(child: Container(height: 80,
                        child: Column(children: [
                          TextButton(onPressed: (){getfromGallery();}, child: Text("Camera")),
                          TextButton(onPressed: (){getfromcamera();}, child: Text("Gallery"))
                        ],),),);
                      });
                    }, icon: Icon(Icons.camera_alt,size: 50,),alignment: Alignment.center,),
                  ),*/


                  CircleAvatar(
                    radius: 60,
                    child: displaySignatureFile(),
                  ),
                  TextButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return Dialog(child:
                        Container(
                          height: 120,
                          child: Column(children: [
                            TextButton(onPressed: (){getfromcamera();Navigator.pop(context);}, child: Text("Camera")),
                            TextButton(onPressed: (){getfromGallery();Navigator.pop(context);}, child: Text("Gallery"))
                          ],),
                        ),);
                    });
                  }, child: Text("Choose Your Photo"))


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  getfromGallery()async{
    PickedFile? pickedFile= await ImagePicker().getImage(source: ImageSource.gallery,
    maxHeight: 300,
    maxWidth: 300);
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  getfromcamera()async{
    PickedFile? pickedFile= await ImagePicker().getImage(source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300);
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget displaySignatureFile(){
    return new SizedBox(
      height: 480,
      width: 480,
      child: imageFile == null?
      new Icon(Icons.camera_alt,size: 50,):ClipRRect(
        borderRadius: BorderRadius.circular(150.0),
        child: new Image.file(imageFile!,fit: BoxFit.fill,),
      )
    );
  }
}
