import 'package:crow_insta_clone/src/controller/auth_controller.dart';
import 'package:crow_insta_clone/src/model/instagram_user.dart';
import 'package:crow_insta_clone/src/pages/login.dart';
import 'package:crow_insta_clone/src/pages/signup_page.dart';
import 'package:crow_insta_clone/src/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          // INFO : 내부 파이어베이스 유저 정보를 조회 with user.data.uid
          return FutureBuilder<IUser?>(
            future: controller.loginUser(user.data!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const App();
              } else {
                return Obx(() => controller.user.value.uid != null
                    ? App()
                    : SignupPage(uid: user.data!.uid));
              }
            },
          );
        } else {
          return const Login();
        }
      },
    );
  }
}
