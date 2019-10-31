import 'dart:async';

import 'package:flutter/services.dart';

class FlutterVideoData {
  static const MethodChannel _channel =
      const MethodChannel('flutter_video_data');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map<dynamic,dynamic>> get getVideos async {
    final Map<dynamic,dynamic> response = await _channel.invokeMethod('getVideos');
    return response;
  }
}
class Video{
  String path;
  String name;
  int id;
  int size;
}
