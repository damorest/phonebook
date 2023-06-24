import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bottomBar.dart';

class AboutPage extends StatefulWidget {
  //final SearchResult searchResult;
  //final String newUrlImage;

  const AboutPage({
    super.key,
    //required this.searchResult,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //late TextEditingController controller;
  //late SearchResult searchResult2;

  @override
  void initState() {
    // searchResult2 = SearchResult(
    //   // title: widget.cardInfo.title,
    //   // numberOfCard: widget.cardInfo.numberOfCard,
    //     imageUrl: widget.searchResult.imageUrl
    // );
    // controller = TextEditingController(text: cardInfo2.title);

    super.initState();
  }

  //
  // void save() {
  //   cardInfo2.title = controller.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text('Contact',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              //height: MediaQuery.of(context).size.height,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
// You can can also directly ask the permission about its status.
//               if (await Permission.location.isRestricted) {
//         print('')
//         };
                    child: const Center(
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: NetworkImage(
                          'https://olivetc.com.ua/images/photo_2020-06-04_09-08-42.jpg'
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Super Man ',
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    // decorationStyle: TextDecorationStyle.solid,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Text(
                  '+38093468222',
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    // decorationStyle: TextDecorationStyle.solid,
                    fontSize: 25,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text('Email : example@gmail.com'),
              ]),
        ),
      ),
      bottomNavigationBar: bottomBar(2),
    );
  }
}
