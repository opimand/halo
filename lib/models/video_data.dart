
import 'dart:convert';

VideoDataModel parseVideoDataFromJson(String str) => VideoDataModel.fromJson(json.decode(str));


class VideoDataModel {
  VideoDataModel({
    this.metaData,
    this.data,
  });

  MetaData metaData;
  List<VideoData> data;

  factory VideoDataModel.fromJson(Map<String, dynamic> json) => VideoDataModel(
    metaData: MetaData.fromJson(json["meta_data"]),
    data: List<VideoData>.from(json["data"].map((x) => VideoData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta_data": metaData.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class VideoData {
  VideoData({
    this.id,
    this.title,
    this.description,
    this.author,
    this.duration,
    this.categoryId,
    this.bgImage,
    this.mediaUrl,
    this.type,
    this.body,
    this.language,
    this.category,
    this.tags,
    this.usageInfo,
  });

  int id;
  String title;
  String description;
  String author;
  int duration;
  int categoryId;
  String bgImage;
  String mediaUrl;
  String type;
  dynamic body;
  String language;
  List<Category> category;
  List<Tag> tags;
  UsageInfo usageInfo;

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    author: json["author"],
    duration: json["duration"],
    categoryId: json["category_id"],
    bgImage: json["bg_image"],
    mediaUrl: json["media_url"],
    type: json["type"],
    body: json["body"],
    language: json["language"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    usageInfo: UsageInfo.fromJson(json["usage_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "author": author,
    "duration": duration,
    "category_id": categoryId,
    "bg_image": bgImage,
    "media_url": mediaUrl,
    "type": type,
    "body": body,
    "language": language,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "usage_info": usageInfo.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
  });

  int id;
  String categoryName;
  String categoryIcon;
  String categoryColor;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    categoryIcon: json["category_icon"],
    categoryColor: json["category_color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_icon": categoryIcon,
    "category_color": categoryColor,
  };
}

class Tag {
  Tag({
    this.id,
    this.tagName,
  });

  int id;
  String tagName;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    tagName: json["tag_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag_name": tagName,
  };
}

class UsageInfo {
  UsageInfo({
    this.progress,
    this.isFavorite,
  });

  int progress;
  bool isFavorite;

  factory UsageInfo.fromJson(Map<String, dynamic> json) => UsageInfo(
    progress: json["progress"],
    isFavorite: json["is_favorite"],
  );

  Map<String, dynamic> toJson() => {
    "progress": progress,
    "is_favorite": isFavorite,
  };
}

class MetaData {
  MetaData({
    this.status,
    this.code,
    this.userMessage,
    this.developerMessage,
  });

  String status;
  int code;
  String userMessage;
  String developerMessage;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    status: json["status"],
    code: json["code"],
    userMessage: json["user_message"],
    developerMessage: json["developer_message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "user_message": userMessage,
    "developer_message": developerMessage,
  };
}
