import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home.dart';
import 'login.dart';
import 'model.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Box<User>? userdata;

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordontroller = TextEditingController();

  final _cofirmpasswordController = TextEditingController();

  void initState() {
    Hive.openBox<User>('mybox');

    userdata = Hive.box<User>('mybox');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SafeArea(
                    child: SafeArea(
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                            onPressed: () {
                              back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            )),
                        elevation: 0,
                        title: const Text(
                          'Signup',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      width: 270,
                      child: Image.asset(
                        'assets/signupitem.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ｊｏｉｎ Ｕｓ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: 'Username',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _passwordontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'password',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _cofirmpasswordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'confirm password',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    minWidth: 300,
                    height: 45,
                    onPressed: () {
                      signup(context);
                    },
                    color: const Color.fromARGB(255, 254, 238, 205),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "signup",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void back() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const Loginpage()));
  }

  Future<void> signup(BuildContext context) async {
    final finalemail = _emailController.text;
    final finalusername = _usernameController.text;
    final finalpassword = _passwordontroller.text;
    final finalconfirmpassword = _emailController.text;

    if (finalemail.isEmpty ||
        finalusername.isEmpty ||
        finalpassword.isEmpty ||
        finalconfirmpassword.isEmpty) {
      return show();
    } else if (finalpassword != finalconfirmpassword) {
      return passworderror();
    } else {
      final student = User(
          username: finalusername,
          email: finalemail,
          password: finalpassword,
          confirmpassword: finalconfirmpassword);
      await userdata!.add(student).then(
        (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Homepage(),
            ),
          );
        },
      );
    }
  }

  Future<void> show() async {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Column(
            children: const [
              Text("Error"),
              Divider(),
            ],
          ),
          content: const Text("field is Empty"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup()));
                Navigator.pop(ctx);
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }

  void passworderror() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Column(
            children: const [
              Text("Error"),
              Divider(),
            ],
          ),
          content: const Text("password does't mateched"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup()));
                Navigator.pop(ctx);
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }
}

class Boxes {
  static Box<User> getuservalues() => Hive.box<User>('mybox');
}
