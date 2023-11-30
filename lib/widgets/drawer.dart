import 'package:card_recharging_ful_application/screens/call_me_back.dart';
import 'package:card_recharging_ful_application/screens/charge_balance.dart';
import 'package:card_recharging_ful_application/screens/transfer_balance.dart';
import 'package:flutter/material.dart';
import 'package:card_recharging_ful_application/models/drawerModel.dart';

import '../utils/direct_call.dart';

Drawer buildMyDrawer(BuildContext context) {
  List<DrawerModel> drawerElements = [
    DrawerModel(title: "Call me", redirectPage:""),
    DrawerModel(title: "Check Balance", redirectPage: ""),
    DrawerModel(title: "Charge Balance", redirectPage: ""),
    DrawerModel(title: "Transfer Balance", redirectPage: ""),
    DrawerModel(title: "Buy Package", redirectPage: ""),
  ];

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 100,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
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
                      MaterialPageRoute(builder: (context) =>  CallMeBack()),
                    );
                    break;
                  case "Charge Balance":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ChargeBalance()),
                    );
                    break;
                  case "Check Balance":
                    callNumber("*804#");
                    break;
                  case "Transfer Balance":
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TransferBalance()),
                    );
                    break;
                  
                  default:
                    // Handle the case where the route is not recognized
                    break;
                }
              },
            ),
          ),
      ],
    ),
  );
}
