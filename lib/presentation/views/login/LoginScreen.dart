import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/widgetfunctions.dart';

class LoginScreen extends StatefulWidget {
  static const path = "Loginscreen";

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/login_image.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(.5),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              height: 44.0 + MediaQuery.of(context).padding.bottom,
              child: Row(),
            ),
            body: loginComponent(height, weight))
      ],
    );
  }

  Widget loginComponent(double height, double width) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: height * 0.04,
              width: width,
              color: Colors.white,
            ),
            getAppBar(height, width,true),
            SizedBox(
              width: width,
              height: height * 0.1,
            ),
            createRoundedEditText(height, width, "Username"),
            SizedBox(height: 20.0),
            createRoundedEditText(height, width, "Password"),
            SizedBox(height: 40.0),
            loginSignBtn(
                height, width, Colors.blue, Colors.white, Colors.blue, "Login"),
            SizedBox(height: 40.0),
            const Center(
                child: Text(
              "------ Or -------",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )),
            const SizedBox(height: 40.0),
            loginSignBtn(height, width, Colors.transparent, Colors.white,
                Colors.white, "Sign Up"),
            SizedBox(height: 20.0),
            const Center(
                child: Text(
                  textAlign :TextAlign.center,
                  "by creating or login into account you're agerring with",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),
                )),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Text(
              'our terms',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                decorationColor: Colors.white, // optional

                decorationThickness: 2, // optional
                decorationStyle: TextDecorationStyle.dashed, // optional
              ),
            ),
              Center(
                  child: Text(
                    textAlign :TextAlign.center,
                    " and ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,),
                  )),
              Text(
                'privacy terms',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white, // optional
                  decorationThickness: 2, // optional
                  decorationStyle: TextDecorationStyle.dashed, // optional
                ),
              ),],)

          ],
        ),
      ],
    );
  }

  Widget loginSignBtn(double height, double width, Color bg, Color textcolor,
      Color borderColor, String title) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: height * 0.08,
        width: width,
        decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: borderColor, width: 2)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, color: textcolor, fontWeight: FontWeight.w500),
          ),
        ));
  }

  Widget createRoundedEditText(
    double height,
    double width,
    String hint,
  ) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: height * 0.08,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey, width: 2)),
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
            hintText: hint),
      )),
    );
  }

}
