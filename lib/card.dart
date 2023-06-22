import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottomBar.dart';
import 'contactPage.dart';
import 'main.dart';

class CardList extends StatelessWidget {
  final String cardInfo;
  final String count;
  //final VoidCallback onTap;

  const CardList({
    Key? key,
    required this.cardInfo,
    required this.count,
   // required this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const number = '+38093468222';

    String GenerateNumber(String number, count) {

       return (number+count).toString();
    }

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),
      child: ListTile(
        title: Text('Super Man $count'),
        subtitle: Text(GenerateNumber(number, count)),
        leading: GestureDetector(onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AboutPage(),
            ),
          );
        },
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://olivetc.com.ua/images/photo_2020-06-04_09-08-42.jpg'
            ),
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