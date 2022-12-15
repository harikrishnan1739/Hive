import 'package:flutter/material.dart';
import 'package:hive_project/singup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 245),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: 330,
                height: 330,
                child: const Image(
                  image: AssetImage('assets/loginpageitem.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Ｗｅｌｃｏｍｅ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.normal,
                        fontSize: 33),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // forgotten();
                      },
                      child: const Text(
                        'forgotten password ?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontStyle: FontStyle.italic,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 300,
                height: 45,
                onPressed: () {
                  // loginUser();
                },
                color: const Color.fromARGB(255, 254, 238, 205),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "login",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: 300,
                height: 45,
                onPressed: () {
                  signup();
                },
                color: const Color.fromARGB(255, 254, 238, 205),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Hi there! We're so glad you decided to give our app a try",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Signup()));
  }
}
