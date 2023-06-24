import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'newContactInfo.dart';

Widget bottomBar(index) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.perm_contact_cal),
        label: 'Phone Book',
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

    },
  );
}