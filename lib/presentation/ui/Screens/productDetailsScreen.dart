import 'package:craftybay/presentation/State_holders/product_details_Controller.dart';
import 'package:craftybay/presentation/ui/Screens/reviewPage.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:craftybay/presentation/ui/utility/urls/color_extention.dart';
import 'package:craftybay/presentation/ui/widgets/Sile_selector.dart';
import 'package:craftybay/presentation/ui/widgets/btm_btn_dtl.dart';
import 'package:craftybay/presentation/ui/widgets/custom_Stepper.dart';
import 'package:craftybay/presentation/ui/widgets/productSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productID;

  const ProductDetailsScreen({super.key, required this.productID});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  //List<String> size = ['S', 'M', 'L', 'X', 'XL', 'XXL'];
  List<String> colors = [];

  int _selectedColorindex = 0;
  int _selectedSizeindex = 0;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductdetails(widget.productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInprogess) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductSlider(
                    imageList: [
                      productDetailsController.productDetails.img1 ?? '',
                      productDetailsController.productDetails.img2 ?? '',
                      productDetailsController.productDetails.img3 ?? '',
                      productDetailsController.productDetails.img4 ?? '',
                    ],
                  ),
                  ProductDetailsAppbar,
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              productDetailsController
                                      .productDetails.product?.title ??'',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 0.5),
                            )),
                            CustomStepper(
                                lowerLimit: 1,
                                upperLimit: 10,
                                stepValue: 1,
                                value: 1,
                                onChange: (newValue) {
                                  print(newValue);
                                  quantity = newValue;
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '${productDetailsController.productDetails.product?.star ?? 0}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(const ReviewPage());
                                  },
                                  child: Text('Review',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.primaryColor)),
                                )),
                            Card(
                              color: AppColor.primaryColor,
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 25,
                          child: ColorSelector(
                            size: productDetailsController.availableColors ,
                            onSelected: (int selectedIndex) {
                              _selectedColorindex = selectedIndex;
                              if(mounted) {
                                setState(() {});
                              }
                            },
                            initialSelected: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Sizes',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 25,
                          child: ColorSelector(
                            size: productDetailsController.availabeSize ,
                            onSelected: (int selectedIndex) {
                              _selectedSizeindex = selectedIndex;
                              if(mounted) {
                                setState(() {});
                              }
                            },
                            initialSelected: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          productDetailsController
                                  .productDetails.product?.shortDes ??
                              '',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Bottmom_Btn_dtls(
                tag: 'Price',
                price: productDetailsController.productDetails.product?.price ??
                    '',
                btnName: 'Add to cart',
                produc_ID: productDetailsController.productDetails.product?.id ?? 0,
                productSize: productDetailsController.availabeSize[_selectedSizeindex],
                productColor: productDetailsController.availableColors[_selectedColorindex],
                quantity: quantity,


              )
            ],
          ),
        );
      }),
    );
  }

  AppBar get ProductDetailsAppbar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product Details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  void ConvertStringToColor(String color) {
    final List<String> Splitedcolors = color.split(',');
    for (String c in Splitedcolors) {
      colors.add(c);
    }
  }
}
