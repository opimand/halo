// To parse this JSON data, do
//
//     final splashVideo = splashVideoFromJson(jsonString);

import 'dart:convert';

SplashVideo splashVideoFromJson(String str) => SplashVideo.fromJson(json.decode(str));

String splashVideoToJson(SplashVideo data) => json.encode(data.toJson());

class SplashVideo {
  SplashVideo({
    this.metaData,
  });

  SplashVideoData metaData;

  factory SplashVideo.fromJson(Map<String, dynamic> json) => SplashVideo(
    metaData: SplashVideoData.fromJson(json["meta_data"]),
  );

  Map<String, dynamic> toJson() => {
    "meta_data": metaData.toJson(),
  };
}

class SplashVideoData {
  SplashVideoData({
    this.status,
    this.code,
    this.userMessage,
    this.developerMessage,
    this.fileName,
    this.fileType,
    this.url,
  });

  String status;
  int code;
  String userMessage;
  String developerMessage;
  String fileName;
  String fileType;
  String url;

  factory SplashVideoData.fromJson(Map<String, dynamic> json) => SplashVideoData(
    status: json["status"],
    code: json["code"],
    userMessage: json["user_message"],
    developerMessage: json["developer_message"],
    fileName: json["file_name"],
    fileType: json["file_type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "user_message": userMessage,
    "developer_message": developerMessage,
    "file_name": fileName,
    "file_type": fileType,
    "url": url,
  };
}
