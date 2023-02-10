import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/services/localization_service.dart';

class Onboarding {
  late String? imgUrl;
  late String? title;
  late String? description;

  Onboarding(this.imgUrl, this.title, this.description);

  Onboarding.fromJson(json) {
    debugPrint('$json');
    title = json[LocalizationService.getLocalizedKey('title')];
    imgUrl = json['image_url'];
  }
}
