import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/login.dart';
import 'package:hive_project/studentdetails.dart';
import 'model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Box<User>? userdata;
  @override
  void initState() {
    userdata = Hive.box<User>('mybox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 102.0),
          child: Text(
            'Explore',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Loginpage()));
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: userdata!.listenable(),
              builder: ((BuildContext context, Box<User> studentList,
                  Widget? child) {
                return ListView.separated(
                    itemBuilder: ((context, index) {
                      final key = studentList.keys.toList()[index];
                      final student = studentList.get(key);
                      final student1 = User(
                          email: student?.email,
                          username: student?.username,
                          password: student?.password,
                          confirmpassword: student?.confirmpassword);
                          
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: ((context) => StudentDetail(
                                    student: student1,
                                  ))));
                        },
                        title: Text(userdata!.name),
                      );
                    }),
                    separatorBuilder: ((context, index) => const Divider()),
                    itemCount: userdata!.values.length);
              }),
            ),
          )
        ],
      ),
    );
  }
}
