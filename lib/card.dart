import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottomBar.dart';
import 'contactPage.dart';
import 'main.dart';
import 'notAllow.dart';

class CardList extends StatelessWidget {
  //final String cardInfo;
  //final String count;
  final String name;
  final String number;
  final String imageAdress;

  //final VoidCallback onTap;

  const CardList({
    Key? key,
    required this.name,
    required this.number,
    required this.imageAdress,
    //required this.cardInfo,
    //required this.count,
    // required this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: ListTile(
        title: Text(name),
        subtitle: Text(number),
        leading: GestureDetector(
          onTap: () async {
            if (await Permission.contacts.request().isGranted) {
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AboutPage(
                    nameContact: name,
                    numberContact: number,
                    adressContact: imageAdress,
                   ),
                ),
              );
              // Either the permission was already granted before or the user just granted it.
            } else {
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AllowContacts(),
                ),
              );
            };
          },

          child: CircleAvatar(
            backgroundImage: NetworkImage(
                imageAdress),
          ),
        ),
        trailing: TextButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            textStyle: const TextStyle(fontSize: 24),
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Call',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            //indirect phone call
            final Uri launchUri = Uri(
              scheme: 'tel',
              path: number,
            );
            await launchUrl(launchUri);

            //direct phone call
            //     bool? res = await FlutterPhoneDirectCaller.callNumber(number);
          },
        ),
      ),
    );
  }
}
