import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/widgetfunctions.dart';

class CarDetailsScreen extends StatefulWidget {
  static const path = "arDetailsScreen";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarDetailsScreen();
  }
}

class _CarDetailsScreen extends State<CarDetailsScreen> {
  final PageController controller = PageController();
  List<String> images = [
    "assets/images/octavia.jpeg",
    "assets/images/octavia_inside1.jpeg",
    "assets/images/ocatavia_inside2.jpeg"
  ];
  List<String> feature = [
    "Auxiliary heading",
    "Immobilizer",
    "Bluetooth",
    "Central locking",
    "ABS/ESP",
    "Navigation system",
    "CD player",
    "keyless entry",
    "Parking sensore"
  ];
  var _currentindex = 1;
  var down = true;

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
            Container(
              height: height * 0.04,
              width: width,
              color: Colors.white,
            ), // height * 0.09
            getAppBarSearch(height, width,context),
            Container(
              height: 2,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              height: height * 0.87 - 2 ,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * 0.87 - 2 - height * 0.08,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          getImagesContainer(),
                          Container(
                            width: width,
                            height: height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ItemwithIcon(
                                    Icon(Icons.add_road, color: Colors.green),
                                    "MILEAGE",
                                    "122.000 km",
                                    context),
                                ItemwithIcon(
                                    Icon(Icons.ac_unit_outlined,
                                        color: Colors.green),
                                    "TRANSM.",
                                    "5",
                                    context),
                                ItemwithIcon(
                                    Icon(Icons.car_repair_sharp,
                                        color: Colors.green),
                                    "BODY",
                                    "SEDAN",
                                    context),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width * 0.9,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          Container(
                            width: width,
                            height: height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ItemwithIcon(
                                    Icon(Icons.settings_suggest_outlined,
                                        color: Colors.green),
                                    "DRIVE",
                                    "FWD",
                                    context),
                                ItemwithIcon(
                                    Icon(Icons.local_gas_station,
                                        color: Colors.green),
                                    "FUEL.",
                                    "GAZOIL",
                                    context),
                                ItemwithIcon(
                                    Icon(Icons.flight, color: Colors.green),
                                    "ENGINE",
                                    "1.5 L 4 CYL",
                                    context),
                              ],
                            ),
                          ),
                          Container(
                            height: 2,
                            width: width,
                            color: Colors.green,
                          ),
                          Container(
                            width: width,
                            height: height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "FEARURES",
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                down
                                    ? Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              down = !down;
                                            });
                                          },
                                          child: Icon(
                                            Icons
                                                .arrow_drop_down_circle_outlined,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ))
                                    : Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              down = !down;
                                            });
                                          },
                                          child: Transform.rotate(
                                            angle: 3.14159,
                                            // Specify the angle in radians (0.5 radians = ~28.65 degrees)
                                            child: Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              size: 30,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width * 0.9,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          down
                              ? Container()
                              : Container(
                                  width: width,
                                  height: height * 0.25,
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          4.50, // Customize the aspect ratio to control height
// Number of columns in the grid
                                    ),
                                    itemCount: feature.length,
                                    // Number of items in the grid
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // Custom layout for each child widget
                                      return Container(
                                        height:
                                            10, // Custom height for the child widget
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                feature[index],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    width: width,
                    color: Colors.green,
                    child: Center(
                        child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Buy",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImagesContainer() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.25,
      width: width,
      child: Stack(
        children: [
          PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentindex = index + 1;
                });
              },
              controller: controller,
              children: images
                  .map((e) => Image.asset(
                        e,
                        fit: BoxFit.fill,
                      ))
                  .toList()),
          Container(
            margin:
                EdgeInsets.only(top: height * 0.25 - height * 0.06, left: 10),
            child: Center(
              child: Text(
                "\$12.000",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.green,
            height: height * 0.05,
            width: width * 0.2,
          ),
          Container(
            margin: EdgeInsets.only(
                top: height * 0.25 - height * 0.06,
                left: width - 10 - width * 0.15),
            child: Center(
              child: Text(
                "$_currentindex/${images.length}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: ShapeDecoration(
              color: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            height: height * 0.05,
            width: width * 0.15,
          ),
          Container(
            margin: EdgeInsets.only(left: width- 40),
            width: 40,
            height: 40,
            child: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
              size: 28.0,
            ),
          )
        ],
      ),
    );
  }
}
