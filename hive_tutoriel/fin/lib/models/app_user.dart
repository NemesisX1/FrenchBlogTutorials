import 'package:hive/hive.dart';
part 'app_user.g.dart';

@HiveType(typeId: 0)
class AppUser extends HiveObject {
  @HiveField(0)
  String username;
  @HiveField(1)
  String password;

  AppUser({
    required this.username,
    required this.password,
  });
}
