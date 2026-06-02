import 'package:catalog_app/data/notifier.dart';
import 'package:catalog_app/new/view/pages/home_page.dart';
import 'package:catalog_app/new/view/pages/profile_page.dart';
import 'package:catalog_app/new/widget/navibar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> page = [HomePage(), ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter "),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return page.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavibarWidget(),
    );
  }
}
