import 'package:crow_insta_clone/src/repository/user_repository.dart';
import 'package:get/get.dart';

import '../model/instagram_user.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    //TODO : DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  // INFO :
  void signup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);

    if (result) {
      user(signupUser);
    } else {}
  }
}
