import 'dart:ffi';

import 'package:cars_sell/presentation/views/cardetail/CarDetailScreen.dart';
import 'package:cars_sell/presentation/views/favscreen/FavScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/UsedCar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<UsedCar> usedCars = [
  UsedCar(
      id: 1,
      name: "Honda Accord",
      model: "2018",
      raportvitesse: 5,
      recentlyadded: false,
      km: "122.000 km",
      users: 1,
      body: "",
      drive: "KMS",
      image: "honda-accord-2018.jpeg",
      price: "21.000 \$"),
  UsedCar(
      id: 2,
      name: "Skoda Ocatavia",
      model: "2016",
      raportvitesse: 5,
      recentlyadded: false,
      km: "222.000 km",
      users: 1,
      body: "",
      drive: "KMS",
      image: "octavia.jpeg",
      price: "18.000 \$"),
  UsedCar(
      id: 3,
      name: "Honda Accord",
      model: "2018",
      raportvitesse: 5,
      recentlyadded: false,
      km: "122.000 km",
      users: 1,
      body: "",
      drive: "KMS",
      image: "toyota-corolla.jpeg",
      price: "18.500 \$"),

];

Widget getAppBar(double height, double width,bool withclose) {
  return Container(
    color: Colors.white,
    height: height * 0.1,
    width: width,
    child: Row(
      children: [
        Container(
          width: withclose? width * 0.82 : width,
          height: 50,
          child: Image.asset(
            "assets/images/logo.png",
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      withclose?  Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 50,
          height: 50,
          child: const Icon(
            Icons.close_rounded,
            color: Colors.grey,
            size: 28.0,
          ),
        ) :Container()
      ],
    ),
  );
}
String getCurrentScreen(BuildContext context) {
  Route<dynamic>? currentRoute = ModalRoute.of(context);
  String currentScreen = currentRoute?.settings.name ?? 'Unknown Screen';
  return currentScreen;
}
Widget getAppBarSearch(double height, double width,BuildContext context) {
  return Container(
    color: Colors.white,
    height: height * 0.09,
    width: width,
    child: Row(
      children: [

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 40,
          height: 40,
          margin: EdgeInsets.only(right: 5),
          child: const Icon(
            Icons.menu,
            color: Colors.grey,
            size: 28.0,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 40,
          height: 40,
          child: InkWell(
              onTap: (){
                print(getCurrentScreen(context));
                if(getCurrentScreen(context)!="/"){
                  Navigator.pop(context);
                }


              },
              child: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 28.0,
          )),
        ),
        Container(
          width:  width * 0.65 ,
          height: 50,
          child: Image.asset(
            "assets/images/logo.png",
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
         Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 40,
          height: 40,
          child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, FavScreenn.path);
              },
              child: Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: 28.0,
          )),
        )
      ],
    ),
  );
}
Widget getAppBarFav(double height, double width,BuildContext context) {
  return Container(
    color: Colors.white,
    height: height * 0.09,
    width: width,
    child: Row(
      children: [

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 40,
          height: 40,
          margin: EdgeInsets.only(right: 5),
          child: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 28.0,
          ),
        ),

        Container(
          width:  width * 0.75 ,
          height: 50,
          child: Image.asset(
            "assets/images/logo.png",
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 2)),
          width: 40,
          height: 40,
          child: InkWell(
              onTap: (){
                print(getCurrentScreen(context));
                if(getCurrentScreen(context)!="/"){
                  Navigator.pop(context);
                }


              },
              child: const Icon(
                Icons.close,
                color: Colors.grey,
                size: 28.0,
              )),
        ),
      ],
    ),
  );
}


Widget getRecentlyCars(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 5, right: 5),
      height: height * 0.34,
      width: width,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: usedCars
            .map((e) {
          return getrecentCarsItem(context, e);
        }).toList(),
      ));
}
Widget getrecentCarsItem(BuildContext context, UsedCar usedCar) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return InkWell(
      onTap: (){
        Navigator.pushNamed(context, CarDetailsScreen.path);

      },
      child: Container(
      height: height * 0.2,
      width: width * 0.9,
      child: Column(
        children: [
          Container(
            width: width,
            height: 2,
            color: Colors.black26,
            margin: EdgeInsets.only(bottom: 8),
          ),
          Row(
            children: [
              Container(
                width: width * 0.4,
                height: height * 0.15,
                child: Image.asset(
                  "assets/images/" + usedCar.image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * 0.55,
                height: height * 0.15,
                margin: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Text("${usedCar.name} modéle ${usedCar.model}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: width * 0.55,
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        ItemwithIcon(Icon(Icons.add_road, color: Colors.grey),
                            "MILEAGE", usedCar.km,context),
                        Container(
                          width: width * 0.03,
                          height: height * 0.01,),
                        ItemwithIcon(
                            Icon(Icons.ac_unit_outlined, color: Colors.grey),
                            "TRANSM.",
                            usedCar.raportvitesse.toString(),context)
                      ],
                    )
                    ,
                    Row(
                      children: [
                        ItemwithIcon(Icon(Icons.car_repair_sharp, color: Colors.grey),
                            "BODY", "SEDAN",context),
                        Container(
                          width: width * 0.03,
                          height: height * 0.01,),
                        ItemwithIcon(
                            Icon(Icons.settings_suggest_outlined, color: Colors.grey),
                            "DRIVE",
                            usedCar.drive.toString(),context)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )));
}
Widget ItemwithIcon(Icon icon, String title, String name,BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.only(top: 5),
    height: height * 0.045,
    width: width * 0.26,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        Column(
          children: [
            Text(title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ],
        )
      ],
    ),
  );
}


Widget getRemondedCarsWidget(
    String title,
    double height, double width, bool isheader, bool isbottom, List<UsedCar> data) {
  return Container(
      color: Color.fromRGBO(42, 45, 47, 1),
      width: width,
      height: height,
      child: !isheader
          ? ListView(
        scrollDirection: Axis.horizontal,
        children: data
            .where((element) => element.recentlyadded == false)
            .map((e) {
          return   getItemRecommended(
              height, width * 0.45, e.image, e.name, e.model, e.price);
        }).toList(),
      )
          : isbottom
          ? Container()
          : Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ));
}

Widget getItemRecommended(double height, double width, String image,
    String name, String model, String price) {
  return   InkWell(child:
    Container(
    width: width,
    height: height,
    color: Colors.black,
    margin: EdgeInsets.only(left: 5, right: 5),
    child: Column(
      children: [
        Container(
          height: height * 0.7,
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.7,
                width: width,
                child: Image.asset(
                  "assets/images/" + image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.5, left: width * 0.6),
                color: Colors.green,
                height: height * 0.2,
                width: width * 0.4,
                child: Center(
                    child: Text(
                      price,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
        Container(
          color: Color.fromRGBO(56, 60, 63, 1),
          height: height * 0.3,
          width: width,
          child: Center(
              child: Text(
                name + " modele " + model,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
        )
      ],
    ),
  ));
}

