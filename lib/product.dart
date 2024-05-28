import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<ImageModel>> loadImages() async {
  String jsonString = await rootBundle.loadString('assets/images.json');
  List<dynamic> json = jsonDecode(jsonString);
  return json.map((item) => ImageModel.fromJson(item)).toList();
}

class ImageModel {
  final int id;
  final String path;

  ImageModel({required this.id, required this.path});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      path: json['path'],
    );
  }
}
