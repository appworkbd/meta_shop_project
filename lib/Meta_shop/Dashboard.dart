import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta_shop/Customwidget/Drawercustom.dart';
import 'package:meta_shop/Customwidget/Modelclass.dart';
import 'package:meta_shop/Meta_shop/Viewpage.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<String> imagelist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg5cx2MLtKEzWm3-I-58FWWthxuqClcZOGDw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAKgUYhblIL_yLMUHj_AqsXg-9UkGRE8frhQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd0wyiX4MzjT0sODojRj1N9O7XCtuWCUoZNA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb_wTU01l-beyr0cTRIKYrOl_ORBx7Ji7psg&usqp=CAU"
  ];

  /*All Product List*/

  final List<productListModel> productlist = [
    productListModel(
        1,
        "Apple Airpod(2nd Gen)",
        "Beats was born to deliver music as the artist intended. Beats Studio Buds are engineered to deliver powerful, balanced sound in a compact design, through an entirely customized acoustic platform.",
        20,
        5,
        200,
        10,
        5,
        "https://image.shutterstock.com/image-photo/white-headphones-wireless-earphones-case-260nw-1521930743.jpg"),
    productListModel(
        2,
        "Product 2",
        "product2 description",
        100,
        10,
        200,
        10,
        5,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo0rQdQFv_o_LuwfmBC37_AtzGR4Yo4BB2UQ&usqp=CAU"),
    productListModel(1, "Product 3", "product3 description", 14, 5, 90, 6, 4,
        "https://1.bp.blogspot.com/-Qr_-BXpuQno/XxP3CsI1pEI/AAAAAAAAElM/_ktHAduBTqw3jIPnvAgk1Z0Frmoy_XBYwCLcBGAsYHQ/s1600/Jewelry%2BDesign%2BImages%2BFor%2BGirls.jpg"),
    productListModel(1, "Product 4", "product4 description", 15, 7, 40, 3, 5,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTakAFb5o0pjkkQP8Yezlv_eGHaGdWeRTpS_g&usqp=CAU"),
    productListModel(1, "Product 5", "product5 description", 60, 6, 150, 10, 5,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTakAFb5o0pjkkQP8Yezlv_eGHaGdWeRTpS_g&usqp=CAU"),
  ];

  int _selectnavposition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: /*Drawer(child:
        ListView(
          children: [
          DrawerHeader(
              child: Column(
            children: [
              Icon(Icons.home,size: 40,),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("user name")),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("username@gmail.com"))
            ],
          )),

            ListTile(title: Text("Home"),
            onTap: (){},
            leading: Icon(Icons.home,color: Colors.deepOrangeAccent,),),

            ListTile(title: Text("Profile"),
              leading: Icon(Icons.account_circle_outlined,color: Colors.deepOrangeAccent,),),

            ListTile(title: Text("Order"),
              leading: Icon(Icons.shopping_cart_rounded,color: Colors.deepOrangeAccent,),),

        ],),),*/
          C_drawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 200,
              child: CarouselSlider.builder(
                  slideBuilder: (index) {
                    return Container(
                      child: Image.network(
                        imagelist[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularWaveSlideIndicator(),
                  autoSliderDelay: Duration(seconds: 5),
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  itemCount: imagelist.length),
            ),
            GridView.builder(
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: productlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  viewPage(productlist[index])));
                    },
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          Flexible(
                              child: Container(
                            child: Image.network(productlist[index].imageurl),
                          )),
                          Text(productlist[index].title)
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Order"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Order"),
        ],
        elevation: 50,
        currentIndex: _selectnavposition,
        backgroundColor: Colors.orange,
        onTap: (int index) {
          setState(() {
            _selectnavposition = index;
          });
          Fluttertoast.showToast(
              msg: index.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR);
        },
      ),
    );
  }
}
