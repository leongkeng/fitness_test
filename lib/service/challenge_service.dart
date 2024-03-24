import 'dart:convert';
import 'dart:io';

import 'package:fitness_app/server/api.dart';
import 'package:fitness_app/service/storage/local_storage.dart';
import 'package:fitness_app/utils/log_helper.dart';
import 'package:http/http.dart' as http;

import 'exception/network_exception.dart';
import 'exception/server_exception.dart';

class ChallengeService {

  static ChallengeService? _instance;
  factory ChallengeService() {
    _instance ??= ChallengeService._();
    return _instance!;
  }
  ChallengeService._();

  static const String tag = "ChallengeService";
  // Base URL for the API should be stored in a config file
  // Allowing to switch between different environments
  final String _baseurl = "https://api.example.com/v1/";

  Future fetchChallengeProgress() async {
    String? token = await LocalStorage().read("token");
    var uri = Uri.parse("$_baseurl${Api.getChallenges}");

    try {
      final response = await http.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"},
      );
      LogHelper().debug(tag, "fetchChallengeProgress: ${response.statusCode}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          // Check if the fetched data is a List
          List<Map<String, dynamic>> challengeList = jsonData
              .map((item) => item as Map<String, dynamic>)
              .toList();
          return challengeList;
        } else {
          throw const FormatException("Invalid JSON format");
        }
      } else {
        throw ServerErrorException("Error fetching challenges");
      }
    } on SocketException {
      throw NetworkErrorException("No network connection");
    }
  }

}