import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:halo/models/splash_data.dart';
import 'package:halo/models/video_data.dart';
import 'package:http/http.dart' as http;

class VideoProvider extends ChangeNotifier {
  List<VideoData> _videoList;
  String _linkSplashVideo;
  final Uri getVideoListUrl =
      Uri.parse('https://devapi.halo-psychology.com/v1/video');
  final Uri getSplashUrl =
      Uri.parse('https://devapi.halo-psychology.com/v1/files/splash');
  final Uri authUrl = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCZR5l028Py7x8Kqd59T7lAqQU6WUnpHok');
  String _token;

  Future<void> fetchVideoList() async {
    await authorization();
    await getVideoList();
  }

  Future<void> authorization() async {
    Map data = {
      "email": "msaudi.cse@gmail.com",
      "password": "AsQw12",
      "returnSecureToken": true
    };

    var body = json.encode(data);

    var response = await http.post(authUrl, body: body);
    try {
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        _token = jsonResponse['idToken'];
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getVideoList() async {
    try {
      var response = await http.get(getVideoListUrl,
          headers: <String, String>{'Authorization': _token});
      if (response.statusCode == 200) {
        final videoData = parseVideoDataFromJson(response.body);
        _videoList = videoData.data.toList();
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getSplashVideo() async {
    try {
      var response = await http.get(getSplashUrl,
          headers: <String, String>{'Authorization': _token});
      if (response.statusCode == 200) {
        final splashVideo = splashVideoFromJson(response.body);
        _linkSplashVideo = splashVideo.metaData.url;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<VideoData> get videoList => _videoList;
  String get linkSplashVideo => _linkSplashVideo;
}
