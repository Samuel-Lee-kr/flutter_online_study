import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_getx_pattern/app/controller/details/details_controller.dart';
import 'package:my_getx_pattern/app/data/provider/api.dart';
import 'package:my_getx_pattern/app/data/repository/posts_repository.dart';

class DetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }

}