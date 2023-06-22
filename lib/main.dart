import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Phone Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(widget.title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        body: Center(child: buildButton()
            // mainAxisAlignment: MainAxisAlignment.center,
            ),
      );

  Widget buildButton() {
    const number = '+380934682229';

    return ListTile(
      title: const Text('Super Man'),
      subtitle: const Text(number),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://olivetc.com.ua/images/photo_2020-06-04_09-08-42.jpg'
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
    );
  }
}
