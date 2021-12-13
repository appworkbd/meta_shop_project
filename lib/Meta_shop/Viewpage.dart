import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_shop/Customwidget/Modelclass.dart';

class viewPage extends StatelessWidget {
  late final productListModel proDetails;

  viewPage(this.proDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viewpage"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          proDetails.imageurl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeSz_YJSZby3rnAR-3d3FN1UFi2YQM0anSZA&usqp=CAU"),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeSz_YJSZby3rnAR-3d3FN1UFi2YQM0anSZA&usqp=CAU"),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeSz_YJSZby3rnAR-3d3FN1UFi2YQM0anSZA&usqp=CAU"),
                      )
                      ,Container(
                        height: 50,
                        width: 50,
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeSz_YJSZby3rnAR-3d3FN1UFi2YQM0anSZA&usqp=CAU"),
                      )
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text("Product ID: ${proDetails.id}"),
                        Text(
                          proDetails.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: .25,
                        ),
                        Card(
                          elevation: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Price:\$ ${proDetails.price}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                /*Text(
                                  "50",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )*/
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Discount:  ${proDetails.discount}%",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                /*Text(
                                  "Product 01",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )*/
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Rateing",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                  ],
                                )
                                /*Text(
                                  "Product 01",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )*/
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Description:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("${proDetails.desc}"),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple,width: 1),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Text("+",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          VerticalDivider(width: 1,thickness: 2,color: Colors.purple,),
                          Text("0",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          VerticalDivider(width: 1,
                            thickness: 2,color: Colors.purple,),
                          Text("-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                      ],
                    ),
                        )),
                    Flexible( flex: 1,
                        child: Container(
                          color: Colors.purple,
                       child: Center(child: Text("Add to cart",style: TextStyle(
                           fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ))
                    ],
                ))
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
      ]),*/
    );
  }
}
