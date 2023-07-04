import 'dart:ffi';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:phonebook/card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bottomBar.dart';
import 'cardInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Phone Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

    final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<CardInfo> _bookUser = [
    CardInfo(
      name: 'Super Man',
      number: '094682229',
        imageUrl:'images/sm1.jpg'
    ),
    CardInfo(
      name: 'Valera',
      number: '06576567229',
        imageUrl:'images/maxresdefault.jpg'
    ),
    CardInfo(
      name: 'Oleg Rabota',
      number: '+309647893309',
        imageUrl:'images/SM.jpg'
    ),
    CardInfo(
        name: 'Olga 150 у.о.',
        number: '+30923437484',
        imageUrl:'images/1.jpg'
    ),
  ];
  //TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: TextField(
                //controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  )),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                //height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    //scrollDirection: Axis.horizontal,
                    itemCount: _bookUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CardList(cardInfo:
                               _bookUser[index],
                            ),
                        );
                    }
                    ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar(0),
      );
}


