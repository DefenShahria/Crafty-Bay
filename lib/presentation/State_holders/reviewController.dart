import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:get/get.dart';

import '../../data/models/reviewModel.dart';
import '../ui/utility/urls/urls.dart';

class ReviewController extends GetxController{
  bool _getReviewInprogress = false;
  bool _postReviewInprogress = false;
  ReviewModel _reviewmodel = ReviewModel();
  
  String _erroeMessege = '';
  bool get getReviewInprogress => _getReviewInprogress;
  bool get postReviewInprogress => _postReviewInprogress;
  ReviewModel get reviewmodel => _reviewmodel;
  
  Future<bool> getReview(int id)async{
    _getReviewInprogress = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.review(id));
    if(response.isSucess){
      _reviewmodel = ReviewModel.fromJson(response.body ?? {});
      _getReviewInprogress = false;
      update();
      return true;
    }else{
      _erroeMessege = 'Fetch Product Review Failed';
      update();
      return false;
    }
  }

  Future<bool> createReview( String des,int id,String rating) async {
    _postReviewInprogress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.CreateProfile,{
      "description": des,
      "product_id":id,
      "rating":rating
    });
    _postReviewInprogress = false;
    update();
    if(response.isSucess) {
      _postReviewInprogress= false;
      return true;
    }else {
      _postReviewInprogress = false;

      _erroeMessege = 'Create Review failed';
      return false;
    }
  }


}