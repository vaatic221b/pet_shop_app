// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shop_app/screens/cart.dart';
import 'package:pet_shop_app/screens/catalog.dart';
import 'package:pet_shop_app/screens/startup.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [
      SvgPicture.asset('assets/icons/house.svg'),
      SvgPicture.asset('assets/icons/catalog.svg'),
      SvgPicture.asset('assets/icons/bot_cart.svg'),
      SvgPicture.asset('assets/icons/profile2.svg'),
    ];

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: iconList[0],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: iconList[1],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: iconList[2],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: iconList[3],
          label: '',
        )
      ],
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return StartPage();
            }));
            break;
          case 1:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const CatalogPage();
            }));
            break;
          case 2:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const CartPage();
            }));
            break;

          //supposedly include profile if this was a real app.
          default:
            break;
        }
      },
    );
  }
}
