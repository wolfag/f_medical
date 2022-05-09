import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f_medical/data/model/topic.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    try {
      if (kDebugMode) {
        // await Future.delayed(const Duration(seconds: 2));
      }

      final jsonContent =
          await rootBundle.loadString("mock/topics/topics.json");
      final List<dynamic> jsonData = jsonDecode(jsonContent);

      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

class RemoteTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    try {
      final response = await Dio().get('//http://your-endpoint');
      final List<dynamic> jsonData = jsonDecode(response.data);

      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
