import 'dart:io';
//import 'dart:js';

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
  String selectImagePath = '';


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
                      PermissionStatus storageStatus = await Permission.photos
                          .request();
                      if (storageStatus == PermissionStatus.granted) {
                        selectImage();
                        setState(() {});
                      }
                      if (storageStatus == PermissionStatus.denied ||
                          storageStatus == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                'Рекомендується надати доступ'),
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
                        backgroundImage:
                        selectImagePath == ''
                            ? Image
                            .asset(widget.cardInfo.imageUrl)
                            .image
                            : Image
                            .file(File(selectImagePath))
                            .image,
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

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Вибрати  фото з :',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectImagePath);
                            if (selectImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Фото не вибрано!'),
                              ),
                              );
                            }
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'images/Galery.png',
                                  height: 60,
                                  width: 60,
                                  ),
                                  Text('Галерея'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectImagePath);
                            if (selectImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Фото не вибрано!'),
                              ),
                              );
                            }
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'images/kamera.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  Text('Камера'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  selectImageFromGallery() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 10);
    if (image != null) {
      return image.path;
    }else {
      return '';
    }
  }

  selectImageFromCamera() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 10);
    if (image != null) {
      return image.path;
    }else {
      return '';
    }
  }
}
