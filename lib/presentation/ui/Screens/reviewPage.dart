import 'package:craftybay/presentation/ui/Screens/AddReviewScreen.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Product Details',style: TextStyle(
          color: Colors.black54,
        ),),
        leading: BackButton(
          color: Colors.black54,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 12,
                        child: Icon(Icons.person,size: 15,color: Colors.grey,),
                      ),
                      title: Text('Defen Shahria'),
                      subtitle: Text('This is really good product '),
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
                    Text('Review (156)',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
                  ],
                ),
                CircleAvatar(
                  radius: 15,

                  child: IconButton(onPressed: () {
                    Get.to(AddReview());
                  },
                      alignment: Alignment.center,
                  icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                ),
              ],
            ),
          )
        ],
      ),



    );
  }
}
