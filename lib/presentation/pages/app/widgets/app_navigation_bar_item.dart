import 'package:flutter/material.dart';

enum AppNavigationBarItems { all, complete, incomplete }

extension AppNavigationBarItemsExtension on AppNavigationBarItems {
  NavigationRailDestination get destination {
    switch (this) {
      case AppNavigationBarItems.all:
        return createRailDestination('All', Icons.apps);
      case AppNavigationBarItems.complete:
        return createRailDestination('Complete', Icons.done_all);
      case AppNavigationBarItems.incomplete:
        return createRailDestination('Incomplete', Icons.incomplete_circle);
    }
  }

  BottomNavigationBarItem get bottom {
    switch (this) {
      case AppNavigationBarItems.all:
        return createBottomBarItem('All', Icons.apps);
      case AppNavigationBarItems.complete:
        return createBottomBarItem('Complete', Icons.done_all);
      case AppNavigationBarItems.incomplete:
        return createBottomBarItem('Incomplete', Icons.incomplete_circle);
    }
  }
}

NavigationRailDestination createRailDestination(String text, IconData icon) {
  return NavigationRailDestination(icon: Icon(icon), label: Text(text));
}

BottomNavigationBarItem createBottomBarItem(String text, IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), label: text);
}
