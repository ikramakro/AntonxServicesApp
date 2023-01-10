import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/category_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/username.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/others/logger_customizations/custom_logger.dart';
import 'package:flutter_antonx_boilerplate/core/services/database_service.dart';

class HomeScreenViewModal extends BaseViewModel {
  final log = CustomLogger(className: 'HomeScreenViewModal');
  Category category = Category();
  DatabaseService databaseService = DatabaseService();
  List<Category> allCategory = [];
  List<Username> allUser = [];
  bool isGotUserData = false;
  String username = '';
  HomeScreenViewModal() {
    getCategory();
    getCurrantuser();
  }

  getCategory() async {
    setState(ViewState.busy);
    allCategory = await databaseService.getCategories();
    log.d(allCategory.length);
    if (allCategory.isEmpty) {
      log.d('no data found');
    }
    setState(ViewState.idle);
  }

  getCurrantuser() async {
    Map<dynamic, dynamic> currantuser = await databaseService.getCurrentuser();
    log.d(' current user $currantuser');
    username = await currantuser['name'];
    isGotUserData = true;
    notifyListeners();
  }
}
