import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.naviFilter});
  final void Function(String identifier) naviFilter;

  @override
  Widget build(BuildContext context) {
    print("MainDrawerMainDrawer");
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Icon(Icons.fastfood),   
                  SizedBox(width: 10),
                  Text("Cooking Up!")
                ],
              )),
          ListTile(
            onTap: () { 
              naviFilter("meal");
            },
            leading: Icon(Icons.restaurant_menu),
            title: Text("Meals"),
          ),
          ListTile(
            onTap: () {
              naviFilter("filter");
            },
            leading: Icon(Icons.settings),
            title: Text("Filters"),
          )
        ],
      ),
    );
  }
}
