import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem{
  TabBarItem(Icon icon, String title):
      super(
         icon: icon,
         activeIcon: icon,
         label: "$title",
      );
}