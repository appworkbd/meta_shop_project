import 'package:flutter/material.dart';

import 'Meta_shop/Splash_screen.dart';
void main(){
  runApp(Meta_shop());
}
class Meta_shop extends StatelessWidget {
  const Meta_shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
