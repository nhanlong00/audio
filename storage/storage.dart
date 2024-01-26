import 'package:firestore/import.dart';
import 'package:hive_flutter/hive_flutter.dart';

// init hive
void init() async {
  await Hive.initFlutter();
}

// save user auth
void saveUserToHive(user) async {
  var box = await Hive.openBox('authInfo');
  await box.put('uid', user.uid);
  await box.put('email', user.email);
}

 getUserAuth(currentUser) async {
  var box = await Hive.openBox('authInfo');
  String uid = await box.get('uid');
  String email = await box.get('email');

  if (email != '' && uid != '') {
    return Get.toNamed('/homepage');
 } else {
    return Get.toNamed('/login_page');
  }
}

void deleteUserAuth() async {
  var box = await Hive.openBox('authInfo');
  if (!empty(box) && box.containsKey('uid') && box.containsKey('email')) {
    await Hive.close();
    await box.delete('uid');
    await box.delete('email');
    await Hive.initFlutter();
  }
}
