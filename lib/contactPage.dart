import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonebook/main.dart';
import 'bottomBar.dart';
import 'cardInfo.dart';
import 'notAllow.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;

  const AboutPage({
    super.key,
    required this.cardInfo,
          });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  void initState() {

    super.initState();
  }

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
                    onTap: () async {
                      PermissionStatus storageStatus = await Permission.photos.request();
                      if(storageStatus == PermissionStatus.granted) {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      }if(storageStatus == PermissionStatus.denied || storageStatus == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Рекомендується надати доступ'),
                          action: SnackBarAction(
                          label: 'Налаштування',
                          onPressed: () {
                            openAppSettings();
                          },
                        )
                        )
                        );
                      }
                    },
                    child: Center(
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: Image.asset(widget.cardInfo.imageUrl).image,
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.cardInfo.name,
                  style: const TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  widget.cardInfo.number,
                  style: const TextStyle(
                      fontSize: 25,
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
