import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../utils/widgetfunctions.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  late double _distanceToField;
  late TextfieldTagsController _controllerMAKE;
  late TextfieldTagsController _controllerMODEL;
  var selectedyearfirst = "";
  var selectedyearlast = "";

  List<String> datayears = [];

  final currentYear = DateTime.now().year;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controllerMAKE.dispose();
    _controllerMODEL.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerMODEL = TextfieldTagsController();
    _controllerMAKE = TextfieldTagsController();
    for (int year = 2010; year <= currentYear; year++) {
      datayears.add("$year");
    }
    selectedyearfirst = datayears.first;
    selectedyearlast = datayears.last;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          height: 44.0 + MediaQuery.of(context).padding.bottom,
          child: Row(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: height * 0.04,
              width: width,
              color: Colors.white,
            ),
            getAppBarSearch(height, width,context),
            Container(
              height: 2,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),

            Container(
              height: height * 0.08,
              width: width,
              child: EditTextMake(
                  "MAKE", height * 0.1, width * 0.82, _controllerMAKE),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              height: height * 0.08,
              width: width,
              child: EditTextMake(
                  "MODEL", height * 0.1, width * 0.82, _controllerMODEL),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              height: height * 0.08,
              width: width,
              child: yearsWidget(
                "YEARS",
                height * 0.1,
                width * 0.82,
              ),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              height: height * 0.08,
              width: width,
              child: priceWidget(
                "PRICE",
                height * 0.1,
                width * 0.82,
              ),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),
            Container(
              height: height * 0.08,
              width: width,
              child: getnearplace(
                height * 0.1,
                width * 0.82,
              ),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.grey.withOpacity(0.2),
            ),

            Container(
              height: height * 0.08,
              width: width,
              margin: EdgeInsets.only(right: 25, left: 25, top: 20,bottom: 50),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey.shade100, width: 2)),
              child: Center(
                  child: InkWell(
                onTap: () {},
                child: const Text(
                  "SEARCH (212 CAR FOUND)",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ),

            getRemondedCarsWidget("PROMOTION",height * 0.1, width, true, false,usedCars),
            getRemondedCarsWidget("PROMOTION",height * 0.18, width, false, false,usedCars),
            Container(
              margin: EdgeInsets.all(10),
              height: height * 0.03,
              width: width,
              child: Text(
                "******RESULT*****",
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromRGBO(42, 45, 47, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            getRecentlyCars(context)

            //EditTextMake()
          ]),
        ));
  }

  Widget EditTextMake(String title, double height, double width,
      TextfieldTagsController controller) {
    ScrollController scrollController = ScrollController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: width * 0.2,
            child: Text(
              title,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Color.fromRGBO(42, 45, 47, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: height,
          width: width * 0.8,
          child: TextFieldTags(
            textfieldTagsController: controller,
            initialTags: const [
              'pick',
              'your',
              'favorite',
              'programming',
              'language'
            ],
            textSeparators: const [' ', ','],
            letterCase: LetterCase.normal,
            validator: (String tag) {
              if (tag == 'php') {
                return 'No, please just no';
              } else if (controller.getTags!.contains(tag)) {
                return 'you already entered that';
              }
              return null;
            },
            inputfieldBuilder:
                (context, tec, fn, error, onChanged, onSubmitted) {
              return ((context, sc, tags, onTagDelete) {
                scrollController = sc;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tec,
                    focusNode: fn,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      focusedBorder: null,
                      helperStyle: null,
                      hintText: controller.hasTags ? '' : "Enter tag...",
                      errorText: error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField * 0.74),
                      prefixIcon: tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: sc,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: tags.map((String tag) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 8,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                            color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text('#$tag',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                          onTap: () {
                                            print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 16.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }).toList()),
                            )
                          : null,
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                  ),
                );
              });
            },
          ),
        ),
        Container(
          child: IconButton(
              iconSize: width * 0.1,
              onPressed: () {
                scrollController.jumpTo(0);
              },
              icon: Icon(Icons.chevron_right_rounded)),
        )
      ],
    );
  }

  Widget yearsWidget(String title, double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: width * 0.2,
            child: Text(
              title,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Color.fromRGBO(42, 45, 47, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          height: height * 0.8,
          width: width * 0.45,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.0),
            // Adjust the value to change the border radius
            border: Border.all(
              color: Color(0xEDF1F3),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButtonFormField<String>(
              value: selectedyearfirst,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedyearfirst = value!;
                });
              },
              items: datayears.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          height: height * 0.8,
          width: width * 0.45,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.0),
            // Adjust the value to change the border radius
            border: Border.all(
              color: Color(0xEDF1F3),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButtonFormField<String>(
              hint: Text("TO"),
              value: selectedyearlast,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedyearlast = value!;
                });
              },
              items: datayears.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget priceWidget(String title, double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: width * 0.2,
            child: Text(
              title,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Color.fromRGBO(42, 45, 47, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 10,
        ),
        Container(
          height: height * 0.6,
          width: width * 0.45,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade100, width: 2)),
          child: Center(
              child: TextField(
            // controller: emailctr,

            keyboardType: TextInputType.text,
            onChanged: (value) {
              // email = value;
            },

            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "12.000 \$"),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: height * 0.6,
          width: width * 0.45,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade100, width: 2)),
          child: Center(
              child: TextField(
            // controller: emailctr,

            keyboardType: TextInputType.text,
            onChanged: (value) {
              // email = value;
            },

            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "12.000 \$"),
          )),
        ),
      ],
    );
  }

  Widget getnearplace(double height, double width) {
    return Row(
      children: [
        Container(
          width: width * 0.4,
          margin: EdgeInsets.only(left: 10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PLACE",
                textAlign: TextAlign.right,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "LOS ENGLES",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromRGBO(42, 45, 47, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
