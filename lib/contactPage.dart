import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bottomBar.dart';
import 'notAllow.dart';

class AboutPage extends StatefulWidget {

  const AboutPage({
    super.key,
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
    //
                    },

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
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Text(
                  '+38093468222',
                  style: TextStyle(
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
