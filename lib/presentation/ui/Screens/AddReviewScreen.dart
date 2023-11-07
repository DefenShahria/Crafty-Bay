import 'package:craftybay/data/models/ProductDetails.dart';
import 'package:craftybay/presentation/ui/Screens/HomePage.dart';
import 'package:craftybay/presentation/ui/Screens/productDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../State_holders/reviewController.dart';

class AddReview extends StatefulWidget {
  final int ID;
  const AddReview({super.key, required this.ID});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final TextEditingController _reviewTEController = TextEditingController();
  final TextEditingController _ratingTEController = TextEditingController();
  final ReviewController reviewController= Get.find<ReviewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Create Review',style: TextStyle(
          color: Colors.black54,
        ),),
        leading: BackButton(
          color: Colors.black54,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: 'Write Review',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,
                      ),),
                  validator:(String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Review';
                    }
                    return null;
                  } ,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _ratingTEController,
                  decoration: const InputDecoration(hintText: 'Rating',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter Rating';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<ReviewController>(
                    builder: (reviewController) {
                      if(reviewController.postReviewInprogress){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          reviewController
                              .createReview(
                              _reviewTEController.text,
                              widget.ID,
                              _ratingTEController.text
                          ).then((result) {
                            if (result == true) {
                              Get.offAll(
                                  ProductDetailsScreen(productID: widget.ID));
                            } else {
                              Get.snackbar('Failed', 'Create profile failed');
                            }
                          });
                        }, child: const Text('Submit'),);
                    },
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
