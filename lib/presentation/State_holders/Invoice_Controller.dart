import 'package:craftybay/data/utility/networkCaller.dart';
import 'package:craftybay/data/utility/networkResponse.dart';
import 'package:craftybay/presentation/ui/utility/urls/urls.dart';
import 'package:get/get.dart';

import '../../data/models/InvoiceModel.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;

  Future<bool> createInvoice() async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice,);
    _inProgress = false;
    update();
    if (response.isSucess && response.body!['msg'] == 'success') {
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.body!);
      return true;
    } else {
      _message = 'Invoice creation failed! Try again';
      return false;
    }
  }
}