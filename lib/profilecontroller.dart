import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project/authentication_repo.dart';
import 'package:practice_project/usermodel.dart';
import 'package:practice_project/userrepository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // moved to account settings screen
  // final fullName = TextEditingController();
  // final email = TextEditingController();
  // final phoneNo = TextEditingController();
  // final password = TextEditingController();



  // get user email to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getSpecificUser(email);
    } else {
      Get.snackbar("Error", "Error :(");
    }
  }

  getPWDDataFromUserData() async {
    final email = await _authRepo.firebaseUser.value?.email;
    if(email != null){
      print("returning! email: $email");
      return _userRepo.getUserPWDData(email);
    } else {
      print("error in getPWDData func");
      Get.snackbar("Error", "Error :(");
    }
  }

  updateUserDetails(UserModel user) async {
    await _userRepo.updateSpecificUser(user);
    await FirebaseAuth.instance.currentUser?.getIdToken(true);
    await FirebaseAuth.instance.currentUser?.reload(); // add this line to reload the user's details
  }

}