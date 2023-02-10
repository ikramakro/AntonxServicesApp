import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_antonx_boilerplate/core/constants/api_end_points.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/login_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/reset_password_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/signup_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/category_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/auth_response.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/base_responses/base_response.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/base_responses/request_response.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/onboarding_response.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/user_profile_response.dart';
import 'package:flutter_antonx_boilerplate/core/others/logger_customizations/custom_logger.dart';
import 'package:flutter_antonx_boilerplate/core/services/api_services.dart';
import 'package:flutter_antonx_boilerplate/locator.dart';

class DatabaseService {
  final log = CustomLogger(className: 'DatabaseService');
  final ApiServices _apiServices = locator<ApiServices>();
  final _firestore = FirebaseFirestore.instance;
  static final DatabaseService _singleton = DatabaseService._internal();
  factory DatabaseService() {
    return _singleton;
  }
  DatabaseService._internal();
  getCurrentuser() async {
    log.d('test');
    Map<String, dynamic> data = {};

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('customer')
        .doc('HGll6ZQMNlrzuCdKl1Oh')
        .get();
    if (documentSnapshot.exists) {
      data = documentSnapshot.data() as Map<String, dynamic>;
      log.d(data);
      return data;
    }

    return data;
  }

  Future<List<Category>> getCategories() async {
    List<Category> category = [];
    try {
      QuerySnapshot snapshot = await _firestore.collection('category').get();
      if (snapshot.docs.isEmpty) {
        log.d("no category found");
      }

      for (int i = 0; i < snapshot.docs.length; i++) {
        category.add(Category.fromJson(
          snapshot.docs[i].data(),
        ));
      }
    } catch (e) {
      log.d(e.toString());
    }
    return category;
  }

  Future<UserProfileResponse> getUserProfile() async {
    final RequestResponse response =
        await _apiServices.get(endPoint: EndPoints.userProfile);
    return UserProfileResponse.fromJson(response.data);
  }

  Future<OnboardingResponse> getOnboardingData() async {
    final RequestResponse response =
        await _apiServices.get(endPoint: EndPoints.onboardingData);
    return OnboardingResponse.fromJson(response.data);
  }

  Future<BaseResponse> updateFcmToken(String deviceId, String token) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.fcmToken,
      data: {
        'device_id': deviceId,
        'token': token,
      },
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> clearFcmToken(String deviceId) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.clearFcmToken,
      data: {'device_id': deviceId},
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithEmailAndPassword(LoginBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.login,
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> createAccount(SignUpBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.signUp,
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> resetPassword(ResetPasswordBody body) async {
    final RequestResponse response = await _apiServices.post(
      endPoint: EndPoints.resetPassword,
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }
}
