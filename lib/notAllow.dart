import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AllowContacts extends StatefulWidget {
  //final SearchResult searchResult;
  //final String newUrlImage;

  const AllowContacts({
    super.key,
    //required this.searchResult,
  });

  @override
  State<AllowContacts> createState() => _AllowContacts();
}

class _AllowContacts extends State<AllowContacts> {
  //late TextEditingController controller;
  //late SearchResult searchResult2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text('Доступ',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: ()
            async {
              var status = Permission.contacts.status;
              if (await status.isDenied) {
                if (!context.mounted) return;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Потрібен доступ до контактів"),
                      titleTextStyle:
                      const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, fontSize: 20),
                      actionsOverflowButtonSpacing: 20,
                      actions: [
                        ElevatedButton(onPressed: () {
                          Navigator.of(context).pop();
                        }, child: const Text("Відміна")),
                        ElevatedButton(onPressed: () {
                          openAppSettings();
                          print('єєєєєєєєєє');
                        }, child: const Text("Налаштування")),
                      ],
                      content: const Text("Надайте дозвіл до контактів"),
                    );
                  },
                );
              };
            },


           child: const Text("Get Contacts")
        ),
      )
    ),
    );
  }
}