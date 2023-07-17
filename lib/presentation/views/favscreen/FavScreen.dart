import 'package:cars_sell/presentation/utils/widgetfunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavScreenn extends StatefulWidget {
  static const path = "favscreen";

  @override
  State<StatefulWidget> createState() {
    return _FavScreenn();
  }
}

class _FavScreenn extends State<FavScreenn> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            getAppBarFav(height, width, context),
            Container(
              height: 2,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              width: width,
              height: height - 30 - height * 0.1,
              child: SingleChildScrollView(
                child: Column(
                  children: usedCars
                      .map((e) => getfaviem(
                          "assets/images/" + e.image, e.price, e.name, e.model))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getfaviem(String image, String price, String name, String version) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: width,
      height: height * 0.3,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.23,
            color: Colors.green,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: width,
            height: height * 0.07,
            color: Colors.grey.withOpacity(0.5),
            child: Row(
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.07,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      price,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: width * 0.62,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [ Text("NEW AT $version",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),),Text(name,style: TextStyle(
                      color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Container(width: 50,height: height * 0.07,child: Center(child: Row(children: [Icon(Icons.camera_alt_outlined,color: Colors.grey,),Text(
                        "2",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),],),),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
