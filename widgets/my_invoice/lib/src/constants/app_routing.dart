import 'package:get/get.dart';
import 'package:my_invoice/src/constants/app_link.dart';
import 'package:my_invoice/src/screens/home/home.dart';
import 'package:my_invoice/src/screens/home/home_binding.dart';
import 'package:my_invoice/src/screens/intro/intro.dart';
import 'package:my_invoice/src/screens/new/new_business/new_business.dart';
import 'package:my_invoice/src/screens/new/new_invoice.dart';
import 'package:my_invoice/src/screens/new/new_invoice_binding.dart';
import 'package:my_invoice/src/screens/new/new_items/add_item.dart';
import 'package:my_invoice/src/screens/new/new_items/items_binding.dart';
import 'package:my_invoice/src/screens/new/new_payer/new_payer.dart';
import 'package:my_invoice/src/screens/new/sign_invoice/sign_invoice.dart';

class AppRouting {
  static final routes = [
    GetPage(
      name: AppLink.intro,
      page: () => const Intro(),
    ),
    GetPage(
      name: AppLink.home,
      page: () => const Home(),
      transition: Transition.circularReveal,
      binding: HomeBinding(),
    ),
     GetPage(
      name: AppLink.newInvoice,
      page: () => const NewInvoice(),
      transition: Transition.fadeIn,
      binding: NewInvoiceBinding(),
    ),
    GetPage(
      name: AppLink.newBusiness,
      page: () => const NewBusiness(),
      transition: Transition.rightToLeftWithFade,
    ),
        GetPage(
      name: AppLink.newPayer,
      page: () => const NewPayer(),
      transition: Transition.rightToLeftWithFade,
    ),
     GetPage(
      name: AppLink.newItem,
      page: () => const AddItem(),
      transition: Transition.rightToLeftWithFade,
      binding: ItemsBinding()
    ),
    GetPage(
      name: AppLink.signature,
      page: () => const SignatureInvoice(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}