import 'package:flutter/cupertino.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';

class ReviewScreenViewModal extends BaseViewModel {
  TextEditingController controller = TextEditingController();

  void setController(String chiptext) {
    controller.text = chiptext;
    notifyListeners();
  }

  TextEditingController getController() {
    return controller;
  }
}
