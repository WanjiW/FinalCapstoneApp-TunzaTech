
import 'package:get/get.dart';
import 'package:practice_project/authentication_repo.dart';
import 'package:practice_project/userinformation.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP (String otp) async {
    print("in verifyOTP that calls the auth repo");
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    if (isVerified) {
      Get.offAll(() => const UserInformation());
    } else {
      Get.back();
    }
  }
}