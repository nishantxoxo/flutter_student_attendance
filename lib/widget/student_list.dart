import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skooliya/providers/students.dart';
import 'package:skooliya/widget/student_item.dart';

class StudentList extends StatelessWidget {
  final int cls;
  final String section;

  StudentList({super.key, required this.cls, required this.section});

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context).getClass(cls, section);

    return Expanded(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          //setting up provider for single student
          value: students[i],
          child: StudentItem(),
        ),
      ),
    );
  }
}
