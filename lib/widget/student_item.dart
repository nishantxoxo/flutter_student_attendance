import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skooliya/providers/student.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<Student>(context);

    return GestureDetector( 
      onTap: () {                                   //dialog box which shows after tapping the card
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Mark Attendance for ${student.name}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      student.setattedance(student.id - 1, true);                  //call the function to set the attendance to present
                      Navigator.pop(context);
                    },
                    child: Text('Present'),
                  ),
                  TextButton(
                    onPressed: () {
                      student.setattedance(student.id - 1, false);                     //call the function to set the attendance to absent
                      Navigator.pop(context);
                    },
                    child: Text('Absent'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        margin:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),             //margins
        elevation: 4,                                                      //card elevation
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),                    //shape of card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Attendance: ${student.attendance ? "present" : "absent"}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: student.attendance ? Colors.green : Colors.red,                 //change the color depending on the attendance status
                  ),
                  const SizedBox(height: 4),
                  Text(
                    student.time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
