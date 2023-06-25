import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bottomBar.dart';
import 'notAllow.dart';

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
                    onTap: () async {
                      PermissionStatus storageStatus = await Permission.storage.request();
                      if(storageStatus == PermissionStatus.granted) {
                        final ImagePicker picker = ImagePicker();
// Pick an image.
                        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      }if(storageStatus == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Рекомендується надати доступ')));
                      }if(storageStatus == PermissionStatus.permanentlyDenied){
                        openAppSettings();
                      }


//                       if (await Permission.storage.request().isGranted) {
//                         if (!context.mounted) return;
//                         final ImagePicker picker = ImagePicker();
// // Pick an image.
//                         final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // Capture a photo.
// //                       final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // // Pick a video.
// //                       final XFile? galleryVideo =
// //                           await picker.pickVideo(source: ImageSource.gallery);
// // // Capture a video.
// //                       final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// // // Pick multiple images.
// //                       final List<XFile> images = await picker.pickMultiImage();
// // // Pick singe image or video.
// //                       final XFile? media = await picker.pickMedia();
// // // Pick multiple images and videos.
// //                       final List<XFile> medias = await picker.pickMultipleMedia();
//                         // Either the permission was already granted before or the user just granted it.
//
//                       }else print('new answer: ${Permission.storage.status.toString()}');
//                        // else {
//                       //   if (!context.mounted) return;
//                       //   Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (BuildContext context) => const AllowContacts(),
//                       //     ),
//                       //   );
//                       // };
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
