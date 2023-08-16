import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController {
  static ProductDetailScreenController get instance => Get.find();

  String truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length > maxWords) {
      return '${words.sublist(0, maxWords).join(' ')} ...';
    }
    return description;
  }
}
