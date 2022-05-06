import 'package:get/get.dart';
import '../controllers/list_controller.dart';
import '../controllers/tap_controller.dart';

/// dependency injection : 클래스를 초기화 : 인스턴스를 생성한다
Future<void> init() async {
  Get.lazyPut(() => TapController(), fenix: true);
  Get.lazyPut(() => ListController(), fenix: true);
}
