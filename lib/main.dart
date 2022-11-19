import 'package:dity/common/splash.dart';
import 'package:dity/shared/bottom_nav.dart';
import 'package:dity/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(
    Phoenix(
      child: MaterialApp(
        title: 'دایتی',
        color: mainColor,
        home: const Splash(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'IRANSans', primarySwatch: Colors.green),
        builder: (BuildContext context, Widget? child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child ?? Container(),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}