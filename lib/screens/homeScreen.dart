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
  String? selectedSection;                            /*whenever these two variables change using setstate in the dropdown menus
                                                        it causes the student list to rebuild which then shows the list of students 
                                                         with selected class and section*/

  final List<int> classes = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
  ];                                                               //options for classes in the dropdown menu

  final List<String> sections = [
    'A',
    'B',
    'C',
    'D'
  ];                                                                //options for sections in the dropdown menu

  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (_) {
        setState(
          () {
            isloading = true;
          },
        );
        Provider.of<Students>(context, listen: false)
            .fetchAndSet();                                                   // fucntion called to get all students from database
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
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(                     //drop down menu for classes
                                                                       
                          decoration:
                              InputDecoration(labelText: 'Select Class'),
                          value: selectedClass,
                          items: classes
                              .map((cls) => DropdownMenuItem(
                                    value: cls,
                                    child: Text(cls.toString()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {                                          //set the selected class value to selected class
                                                             
                              selectedClass = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(                    //drop down menu for sections
                                                                       
                          decoration:
                              InputDecoration(labelText: 'Select Section'),
                          value: selectedSection,
                          items: sections
                              .map((sec) => DropdownMenuItem(
                                    value: sec,
                                    child: Text(sec),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSection =
                                  value;                                      //set the selected section value to selected section
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (selectedClass == null ||
                      selectedSection ==
                          null)                                              //if class and section is not selected
                    Center(
                      child: Text("please select class and section"),
                    )
                  else
                    StudentList(
                        cls: selectedClass!,
                        section:
                            selectedSection!)                                 //after class and section have been selected render this widget
                ],
              ),
            ),
    );
  }
}
