import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'newContactInfo.dart';

Widget bottomBar(index) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_ic_call),
        label: 'Add Contact',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Favorite',
      ),


    ],
    currentIndex: index,
    selectedItemColor: Colors.amber[800],
    onTap: (index) {
      if(index == 0)
        {
          openAppSettings();
        }

    },
  );
}