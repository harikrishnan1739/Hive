import 'package:flutter/material.dart';
import 'package:hive_project/model.dart';

class StudentDetail extends StatefulWidget {
const StudentDetail({Key? key, required User student}) : super(key: key);

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  late User student1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Student Details '),
        backgroundColor: Colors.blue,
        leading: (IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back))),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Name : ${student1.username}'),
            const SizedBox(
              height: 20,
            ),
            Text('Age : ${student1.email}'),
          ],
        ),
      ),
    );
  }
}
