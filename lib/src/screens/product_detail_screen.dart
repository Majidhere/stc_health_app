import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_health_app/src/controllers/product_detail_screen_controller.dart';
import 'package:stc_health_app/src/custom_widgets/app_main_button.dart';
import 'package:stc_health_app/src/custom_widgets/product_detail_bottom_sheet.dart';
import 'package:stc_health_app/src/models/all_products_model.dart';
import 'package:stc_health_app/src/theme/app_text_theme.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);
  final ProductDetailScreenController controller =
      Get.put(ProductDetailScreenController());
  final ProductsModel product = Get.arguments as ProductsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.red,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.fill)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                margin: const EdgeInsets.only(
                                    left: 5, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          2, 2), // Adjust the shadow's position
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.arrow_back)),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, bottom: 5, top: 5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(2,
                                            2), // Adjust the shadow's position
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert))),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Details",
                            style: productDetailTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "${product.price} AED",
                                    style: productDetailPriceTextStyle,
                                  ),
                                ),
                              ]),
                        )
                      ]),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    )
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
                                Get.bottomSheet(
                                  ProductDetailBottomSheet(
                                    product: product,
                                  ),
                                  isScrollControlled: true,
                                );
                              },
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.cyan,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                                child: const Icon(
                                  Icons.ios_share_sharp,
                                  color: Colors.cyan,
                                ),
                              ),
                              AppButton(
                                  height: 55,
                                  screenWidth:
                                      MediaQuery.of(context).size.width,
                                  controller: controller,
                                  onPressed: () {},
                                  buttonText: "Order Now",
                                  screenWidthMultiplier: 0.7)
                            ]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Description",
                          style: productTitleTextStyle,
                        ),
                      ),
                      //const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                          controller.truncateDescription(
                              product.description, 50),
                          style: productDetailDescriptionTextStyle,
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
