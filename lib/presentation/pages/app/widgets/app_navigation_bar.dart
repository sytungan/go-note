import 'package:flutter/material.dart';
import 'package:gonote/presentation/pages/app/widgets/widgets.dart';

class AppNavigationBars {
  AppNavigationBars._();

  static final NavigationRail navigationRail = NavigationRail(
    selectedIndex: 0,
    destinations:
        AppNavigationBarItems.values.map((e) => e.destination).toList(),
  );
  static final BottomNavigationBar navigationBottom = BottomNavigationBar(
    items: AppNavigationBarItems.values.map((e) => e.bottom).toList(),
  );
}
