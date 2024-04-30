import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hello/views/lang.dart';
import 'package:hello/views/otp.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;

  RxString errorMessagePhoneNumber = ''.obs;
  TextEditingController phoneAuthController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  Logger logger = Logger();

  RxBool isLoading = false.obs;

  Future<bool> checkSignInStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    // Check if the user is signed in
    return user != null;
  }

  Future<void> phoneAuth() async {
    isLoading(true);
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91${phoneAuthController.text.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          isLoading(false);
          Get.offAll(() => const Lag());
        },
        verificationFailed: (e) {
          isLoading(false);
          Fluttertoast.showToast(
            msg: "Verification Failed $e",
            // Other toast configuration...
          );
        },
        codeSent: (String verificationId, int? token) {
          Get.to(() => OTP(
                verficationCode: verificationId,
              ));
          isLoading(false);
        },
        codeAutoRetrievalTimeout: (e) {
          isLoading(false);
          Fluttertoast.showToast(
            msg: e,
            // Other toast configuration...
          );
        },
      );
    } catch (e) {
      // Handle any exceptions that might occur during the authentication process
      isLoading(false);
      print("Error during phone authentication: $e");
      Fluttertoast.showToast(
        msg: "An error occurred during authentication",
        // Other toast configuration...
      );
    }
  }

  verifyPhoneNumber({required String verficationCode}) async {
    final credentials = PhoneAuthProvider.credential(
        verificationId: verficationCode,
        smsCode: otpController.text.toString());
    try {
      isLoading.value = true;
      await auth.signInWithCredential(credentials);
      isLoading.value = false;

      Get.offAll(() => const Lag());
    } catch (e) {
      Logger().d(e);
      Fluttertoast.showToast(
        msg: "invalid otp",
        // Other toast configuration...
      );
    }
  }
}
