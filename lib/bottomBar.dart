import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomBar() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Головна',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: 'Улюблене',
      ),

    ],
    currentIndex: 1,
    selectedItemColor: Colors.amber[800],
    onTap: (index) {
      //Navigator.of(context).pop();
    },
  );
}