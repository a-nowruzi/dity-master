import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:dity/pages/calender/calender.dart';
import 'package:dity/pages/home/home.dart';
import 'package:dity/pages/notification/notification.dart';
import 'package:dity/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'color.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  late bool isLoading = true;
  late int numberOfCart;

  List<Widget> widgetOptions = const <Widget>[
    Home(),
    Calender(),
    Notification1(),
    Search()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar:
            Container(
            color: backgroundColor,
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 8),
                    child: GNav(
                        rippleColor: Colors.grey[300]!,
                        hoverColor: Colors.grey[100]!,
                        gap: 8,
                        activeColor: Colors.black,
                        iconSize: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        duration: const Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey[100]!,
                        color: Colors.black,
                        tabs: const [
                          GButton(
                              icon: AntIcons.homeOutlined, text: 'خانه'),
                          GButton(
                              icon: AntIcons.calendarOutlined, text: 'تقویم'),
                          GButton(
                              text: 'اعلان ها',
                              icon: AntIcons.notificationFilled,),
                          //      GButton(icon: AntIcons.shoppingCartOutlined, text: 'سبد خرید'),
                          GButton(
                              icon: AntIcons.searchOutlined,
                              text: 'جستجو')
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) async {
                        })))));
  }
}
