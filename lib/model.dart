import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 2, adapterName: 'useradapter')
class User extends HiveObject{
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? confirmpassword;
  User(
      { this.email,
      this.username,
      this.password,
      this.confirmpassword});



}
