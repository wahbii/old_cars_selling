import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/UsedCar.dart';
import '../../utils/widgetfunctions.dart';

class CarsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarsScreen();
  }
}

class _CarsScreen extends State<CarsScreen> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 4.0, right: 4.0),
          height: 44.0 + MediaQuery.of(context).padding.bottom,
          child: Row(),
        ),
        body: Column(
          children: [
            Container(
              height: height * 0.04,
              width: width,
              color: Colors.white,
            ),
            getAppBar(height, width, false),
            getRemondedCarsWidget("RECOMENDED",height * 0.1, width, true, false,usedCars),
            getRemondedCarsWidget("RECOMENDED",height * 0.18, width, false, false,usedCars),
            getRemondedCarsWidget("RECOMENDED",height * 0.02, width, true, true,usedCars),
            Container(
              margin: EdgeInsets.all(10),
              height: height * 0.03,
              width: width,
              child: Text(
                "RECENTLY ADDED",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromRGBO(42, 45, 47, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            getRecentlyCars(context)
          ],
        ));
  }




}
