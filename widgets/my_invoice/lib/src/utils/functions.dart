import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

// 메시지 번역, 복수형 및 성별, 날짜/숫자 형식 지정 및 구문 분석, 양방향 텍스트를 포함한 국제화 및 현지화 기능을 제공

class Functions {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static void saveInvoice(
      {required String name,
      required Uint8List fileBytes,
      String path = '/storage/emulated/0/Documents'}) async {
    try {
      bool checkPermission = await Permission.storage.request().isGranted;
      if (checkPermission) {
        File pdfDoc = File('$path/$name');
        await pdfDoc.writeAsBytes(fileBytes);
        Get.snackbar('done', 'Invoice Saved Successfully to $path/$name',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('ERROR', 'Storage permission denied !, please try again!',
            snackPosition: SnackPosition.BOTTOM);
        Future.delayed(const Duration(seconds: 2));
        await Permission.storage.request();
      }
    } on FileSystemException catch (e) {
      Get.snackbar('ERROR', '${e.message} $path/$name',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('ERROR', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
