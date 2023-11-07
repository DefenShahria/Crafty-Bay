import 'package:craftybay/presentation/State_holders/reviewController.dart';
import 'package:craftybay/presentation/ui/Screens/AddReviewScreen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../State_holders/user_info_controller.dart';

class ReviewPage extends StatefulWidget {
  final int productID;
  const ReviewPage({super.key, required this.productID});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewController>().getReview(widget.productID);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.find<UserInfoController>().getuserinfo();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Product Review',style: TextStyle(
          color: Colors.black54,
        ),),
        leading: BackButton(
          color: Colors.black54,
        ),
      ),
      body: InkWell(
        onTap: (){

        },
        child: GetBuilder<ReviewController>(
          builder: (reviewController) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: reviewController.reviewmodel.data?.length,
                      itemBuilder: (context,index){
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 12,
                              child: Icon(Icons.person,size: 15,color: Colors.grey,),
                            ),
                            title: Text(reviewController.reviewmodel.data?.first.profile?.cusName! ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(reviewController.reviewmodel.data?.first.description ?? '',maxLines: 3,),
                                Text('Rating: ${reviewController.reviewmodel.data?.first.rating}' ?? '',),
                                Text('Date: ${reviewController.reviewmodel.data?.first.updatedAt}' ?? '',),
                                Text('Product ID: ${reviewController.reviewmodel.data?.first.productId}' ?? '',),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration:
                  BoxDecoration(color: AppColor.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Review ${reviewController.reviewmodel.data?.length?? 0}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      CircleAvatar(
                        radius: 15,

                        child: IconButton(onPressed: () {
                          Get.to(AddReview(ID: widget.productID,));
                        },
                            alignment: Alignment.center,
                        icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),



    );
  }
}
