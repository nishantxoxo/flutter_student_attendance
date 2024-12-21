import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skooliya/providers/students.dart';
import 'package:skooliya/widget/student_list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

bool isloading = false;

class _HomescreenState extends State<Homescreen> {
  int? selectedClass;
  String? selectedSection;

  final List<int> classes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<String> sections = ['A', 'B', 'C', 'D'];
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (_) {
        setState(
          () {
            isloading = true;
          },
        );
        Provider.of<Students>(context, listen: false).fetchAndSet();
        setState(
          () {
            isloading = false;
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: 'Select Class'),
                    value: selectedClass,
                    items: classes
                        .map((cls) => DropdownMenuItem(
                              value: cls,
                              child: Text(cls.toString()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Select Section'),
                    value: selectedSection,
                    items: sections
                        .map((sec) => DropdownMenuItem(
                              value: sec,
                              child: Text(sec),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSection = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (selectedClass == null || selectedSection == null)
              Center(
                child: Text("please select class and section"),
              )
            else
              StudentList(cls: selectedClass!, section: selectedSection!)
          ],
        ),
      ),
    );
  }
}
