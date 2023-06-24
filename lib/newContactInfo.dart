import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactCard extends StatelessWidget {
  //final String cardInfo;
  //final String count;
  //final VoidCallback onTap;

  const ContactCard({
    Key? key,
    //required this.cardInfo,
    //required this.count,
    // required this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    ''
                ),
              ),
            ),
          ),
          TextField(
              decoration: const InputDecoration(labelText: "Enter your name"),
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly]
          ),
          TextField(
              decoration: const InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly]
          ),
          TextField(
              decoration: const InputDecoration(labelText: "Enter your email"),
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly]
          ),
                ElevatedButton(
                onPressed: () {
    // save();
    // Navigator.of(context).pop(cardInfo2);
    },
    child: const Text('Save'),
                ),
        ],
      ),
    );
  }
  }
