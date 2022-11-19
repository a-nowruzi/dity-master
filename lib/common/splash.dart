import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../shared/bottom_nav.dart';
import '../../shared/color.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../shared/loading.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  late Widget navigateToScreen;
  bool checkedOnce = false;
  double uploadPercent = 0.0;



  startTimeError() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, checkNavigator);
  }

  checkNavigator() async {
    try {

      List<InternetAddress>? result = [];
      if(kIsWeb == false){
        result = await InternetAddress.lookup('golpouneh.com');
      }
      if (kIsWeb ||(result.isNotEmpty && result[0].rawAddress.isNotEmpty)) {
   if (!mounted) return;
          Timer(const Duration(seconds: 3), () {

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const BottomNav()));

          });
        }
      }
     on SocketException catch (_) {
      if (!checkedOnce) {
        if (!mounted) return;
        settingModalBottomSheet(context);
      }
      startTimeError();
    }
  }

  @override
  void initState() {
    super.initState();
    checkNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Stack(children: [
          Container(
            color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
             ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 180),
                      child: Image.asset('assets/images/daity.png', width: 220)),
                  Container(
                    child: Text("بستنی دایتی",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 100,
                      height: 20,
                      child: Loading.linearSmall())
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: const Text('نسخه 1.0.0',
                        style: TextStyle(fontSize: 13, color: Colors.white)))
              ])
        ]));
  }
  void settingModalBottomSheet(context) {
    setState(() {
      checkedOnce = true;
    });
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  height: 50,
                  color: Colors.blueAccent,
                  child: const Center(
                      child: Text('اتصال اینترنت خود را بررسی نمایید',
                          textScaleFactor: 1,
                          style:
                          TextStyle(fontSize: 15, color: Colors.white)))));
        });
  }
  @override
  void dispose() {
    super.dispose();
  }
}

