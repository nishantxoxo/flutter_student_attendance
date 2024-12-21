import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:skooliya/url.dart';

class Student with ChangeNotifier {
  final int id;
  final String name;
  final int cls;
  final String section;
  bool attendance;
  String time;

  Student(
      {required this.id,
      required this.name,
      required this.cls,
      required this.section,
      this.attendance = false,
      this.time = "--:--"});

  void setattedance(int id, bool att) {
    final url =
        '$DATABASE_URL/$id.json';
    final currtime = att ? DateFormat('HH:mm').format(DateTime.now()) : "--:--";
    attendance = att;
    time = currtime;
    notifyListeners();
    http.patch(Uri.parse(url),
        body: json.encode({'present': att, 'time': currtime}));
  }
}
