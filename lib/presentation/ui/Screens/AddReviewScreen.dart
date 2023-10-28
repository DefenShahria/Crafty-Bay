import 'package:craftybay/presentation/ui/Screens/HomePage.dart';
import 'package:craftybay/presentation/ui/utility/Image_data/Image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
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
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'First Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Last Name',

                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: 'Write Review',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16,)

                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(const HomePage());
                    }, child: const Text('Submit'),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
