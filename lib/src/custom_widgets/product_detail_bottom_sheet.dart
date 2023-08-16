import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_health_app/src/controllers/bottom_sheet_controller.dart';
import 'package:stc_health_app/src/custom_widgets/star_rating.dart';
import 'package:stc_health_app/src/models/all_products_model.dart';

import '../theme/app_text_theme.dart';
import 'app_main_button.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  final ProductsModel product;

  ProductDetailBottomSheet({super.key, required this.product});

  final BottomSheetController controller = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back(); // Close the bottom sheet
                },
                child: const Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.cyan),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.ios_share_sharp, color: Colors.cyan),
                ),
                AppButton(
                  height: 55,
                  screenWidth: MediaQuery.of(context).size.width,
                  controller: controller,
                  onPressed: () {},
                  buttonText: "Order Now",
                  screenWidthMultiplier: 0.7,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Description", style: productTitleTextStyle),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              product.description,
              style: productDetailDescriptionTextStyle,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    "Reviews (${product.rating.count})",
                    style: productReviewTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.rating.rate.toString(),
                        style: productRatingTextStyle,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      StarRating(rating: product.rating.rate),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
