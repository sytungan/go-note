import 'package:flutter/material.dart';
import 'package:gonote/presentation/pages/app/widgets/widgets.dart';

class AppNavigationBars {
  AppNavigationBars._();

  static final List<NavigationRailDestination> navigationRailDestinations =
      AppNavigationBarItems.values.map((e) => e.destination).toList();
  static final List<BottomNavigationBarItem> navigationBottomItems =
      AppNavigationBarItems.values.map((e) => e.bottom).toList();
}
