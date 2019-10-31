import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_video_data/flutter_video_data.dart';
import 'package:permissions_plugin/permissions_plugin.dart';

void main() async{

      await PermissionsPlugin
          .checkPermissions([
        Permission.READ_EXTERNAL_STORAGE,
        Permission.WRITE_EXTERNAL_STORAGE,
      ]);
      await PermissionsPlugin
          .requestPermissions([
        Permission.READ_EXTERNAL_STORAGE,
        Permission.WRITE_EXTERNAL_STORAGE,
      ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    // Platform messages may fail, so we use a try/catch PlatformException.


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
           child: Text("getVideos"),
            onPressed: () async{
         Map<dynamic,dynamic> videos=   await FlutterVideoData.getVideos;
            },
          )
        ),

      ),
    );
  }
}
