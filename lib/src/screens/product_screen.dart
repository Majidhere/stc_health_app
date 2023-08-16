import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_health_app/src/controllers/product_screen_controller.dart';
import 'package:stc_health_app/src/screens/product_detail_screen.dart';
import 'package:stc_health_app/src/theme/app_text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../custom_widgets/star_rating.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final ProductScreenController controller = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35),
        )),
        title: Text(
          "All Products",
          style: appBarTextStyle,
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: BottomNavigationBar(
              selectedItemColor: Colors.cyan,
              unselectedItemColor: Colors.grey,
              currentIndex: 0,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 35),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svgs/cart.svg',
                    width: 20,
                    height: 20,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svgs/like.svg',
                      width: 20, height: 20),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svgs/user.svg',
                      width: 20, height: 20),
                  label: '',
                ),
              ]),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              FutureBuilder(
                future: controller.fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text("Error! Failed to load products"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No Products Available"));
                  } else {
                    final products = snapshot.data!;
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => ProductDetailScreen(),
                                        arguments: product);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(product.image),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15,
                                                left: 10,
                                                right: 15),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${product.price.toString()} AED",
                                                    style:
                                                        productPriceTextStyle,
                                                  ),
                                                  StarRating(
                                                      rating:
                                                          product.rating.rate),
                                                ]),
                                          )
                                        ]),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(product.title,
                                    style: productTitleTextStyle),
                                const SizedBox(height: 5),
                                Text(
                                  controller.truncateDescription(
                                      product.description, 25),
                                  style: productDescriptionTextStyle,
                                ),
                              ]),
                        );
                      },
                    );
                  }
                },
              ),
            ]),
          )),
    );
  }
}
