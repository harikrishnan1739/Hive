import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project/model.dart';

import 'splash.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // hive initalizing
  await Hive.initFlutter();
  // open box
  Hive.registerAdapter(useradapter());
  await Hive.openBox<User>('mybox');
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
