import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogHelper {
  static final LogHelper _singleton = LogHelper._internal();
  final RxList<String> logs = <String>[].obs;

  factory LogHelper() {
    return _singleton;
  }

  LogHelper._internal();

  void debug(String tag, String msg) {
    String log = "[$tag] $msg";
    logs.add(log);
    debugPrint(log);
  }
}