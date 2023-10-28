import 'package:craftybay/data/models/CategoryData.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';

class Category_cart extends StatelessWidget {
  const Category_cart({
    super.key, required this.categorydata, required this.onTap,
  });

  final CategoryData categorydata;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              height: 65,
              width: 65,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Image.network(categorydata.categoryImg ?? '',height: 50,width: 40,),
            ),
            SizedBox(height: 8,),
            Text(categorydata.categoryName ?? '',style: TextStyle(
              fontSize: 12,
              color: AppColor.primaryColor,
              letterSpacing: 0.4,
            ),)
          ],
        ),
      ),
    );
  }
}
