import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_getx_pattern/app/controller/home/home_controller.dart';
import 'package:my_getx_pattern/app/data/provider/api.dart';
import 'package:my_getx_pattern/app/data/repository/posts_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
