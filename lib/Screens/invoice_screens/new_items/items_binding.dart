
import 'package:get/get.dart';
import 'package:invoiceapp/Controller/items_controller.dart';

class ItemsBidning extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemsController(), permanent: true);
  }
}
