import 'package:flutter/material.dart';

class C_drawer extends StatelessWidget {
  const C_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(decoration: BoxDecoration(color: Colors.greenAccent),
              child: Column(
            children: [
              Icon(
                Icons.home,
                size: 40,
              ),
              Container(
                  alignment: Alignment.topLeft, child: Text("user name")),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("username@gmail.com"))
            ],
          )),
          ListTile(
            tileColor: Colors.deepPurpleAccent,
            title: Text("Home"),
            onTap: () {},
            leading: Icon(
              Icons.home,
              color: Colors.deepOrangeAccent,
            ),
          ),
          ListTile(
            title: Text("Profile"),
            leading: Icon(
              Icons.account_circle_outlined,
              color: Colors.deepOrangeAccent,
            ),
          ),
          ListTile(
            title: Text("Order"),
            leading: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}
