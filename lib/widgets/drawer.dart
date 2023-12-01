import 'package:flutter/material.dart';
import 'package:card_recharging_ful_application/models/drawerModel.dart';
import 'package:card_recharging_ful_application/screens/call_me_back.dart';

Drawer buildMyDrawer(BuildContext context) {
  List<DrawerModel> drawerElements = [
    DrawerModel(title: "Call me", redirectPage: ""),
    DrawerModel(title: "Check Balance", redirectPage: ""),
    DrawerModel(title: "Charge Balance", redirectPage: ""),
    DrawerModel(title: "Transfer Balance", redirectPage: ""),
    DrawerModel(title: "Buy Package", redirectPage: ""),
  ];

  return Drawer(
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF51C25B),
              ),
              child: Text('Drawer Header'),
            ),
          ),
          for (var drawerElement in drawerElements)
            Card(
              elevation: 6,
              child: ListTile(
                title: Text(drawerElement.title),
                onTap: () {
                  switch (drawerElement.title) {
                    case "Call me":
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CallMeBack()),
                      );
                      break;
                  // Add cases for other routes
                    default:
                    // Handle the case where the route is not recognized
                      break;
                  }
                },
              ),
            ),
        ],
      ),
    ),
  );
}
