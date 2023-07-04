import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bottomBar.dart';
import 'cardInfo.dart';
import 'contactPage.dart';
import 'main.dart';
import 'notAllow.dart';

class CardList extends StatelessWidget {
  final CardInfo cardInfo;
    //final VoidCallback onTap;

  const CardList({
    Key? key,
     required this.cardInfo,
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: ListTile(
        title: Text(cardInfo.name),
        subtitle: Text(cardInfo.number),
        leading: GestureDetector(
          onTap: () async {
            if (await Permission.contacts.request().isGranted) {
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AboutPage(cardInfo: cardInfo,),
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
            backgroundImage: Image.asset(cardInfo.imageUrl).image,
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
              path: cardInfo.number,
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
