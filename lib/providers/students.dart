import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skooliya/providers/student.dart';
import 'package:http/http.dart' as http;
import 'package:skooliya/url.dart';

class Students with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get student {
    return [..._students];
  }

  List<Student> getClass(int clas, String section) {
    return _students
        .where(
          (element) => element.cls == clas && element.section == section,
        )
        .toList();
  }

  Future<void> fetchAndSet() async {
    var url =
        "$DATABASE_URL/.json";

    try {
      final response = await http.get(Uri.parse(url));
      final extracted = json.decode(response.body) as List<dynamic>;

      final List<Student> tempList = [];
      extracted.forEach(
        (data) {
          tempList.add(Student(
              id: data['id'],
              name: data['name'],
              cls: data['class'],
              section: data['section'],
              attendance: data['present'],
              time: data['time']));
        },
      );
      _students = tempList;
  
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
