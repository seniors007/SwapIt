import 'package:get/get.dart';

class UserController extends GetxController {
  var userId = 0.obs;
  var userName = ''.obs;
  var roles = <String>[].obs;

  void setUser(int id, String name, List<String> userRoles) {
    userId.value = id;
    userName.value = name;
    roles.value = userRoles;
  }
}
