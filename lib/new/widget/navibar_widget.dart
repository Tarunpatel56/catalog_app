import 'package:catalog_app/data/notifier.dart';
import 'package:flutter/material.dart';

class NavibarWidget extends StatefulWidget {
  const NavibarWidget({super.key});

  @override
  State<NavibarWidget> createState() => _NavibarWidgetState();
}

class _NavibarWidgetState extends State<NavibarWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),

            NavigationDestination(icon: Icon(Icons.person), label: "profile"),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
