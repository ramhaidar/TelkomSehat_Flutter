import 'package:flutter/material.dart';

class HomepageWidget extends StatefulWidget {
  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomepageWidget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(237, 248, 254, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 87,
              left: 16,
              child: Container(
                  width: 327,
                  height: 117,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1599999964237213),
                          offset: Offset(0, -2),
                          blurRadius: 7)
                    ],
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ))),
          Positioned(
              top: 121,
              left: 157,
              child: Text(
                'Banner',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 3.3333333333333335),
              )),
          Positioned(
              top: 734,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1599999964237213),
                        offset: Offset(0, -2),
                        blurRadius: 7)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 0),
                          Text(
                            'Home',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 41, 112, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 39),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 0),
                          Text(
                            'Dashboard',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 41, 112, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 39),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 0),
                          Text(
                            'Reservasi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 41, 112, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 39),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 0),
                          Text(
                            'Konsultasi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 41, 112, 1),
                                fontFamily: 'Montserrat',
                                fontSize: 10,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(top: 0, left: 0, child: Container()),
        ]));
  }
}
