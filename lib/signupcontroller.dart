// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:practice_project/accountverification1.dart';
// import 'package:practice_project/authentication_repo.dart';
// import 'package:practice_project/homepage.dart';
// import 'package:practice_project/otpcontroller.dart';
// import 'package:practice_project/signin.dart';
// import 'package:practice_project/userinformation.dart';
// import 'package:practice_project/usermodel.dart';
// import 'package:practice_project/userrepository.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class SignUpController extends GetxController{
//   static SignUpController get instance => Get.find();
//
//   // first two
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNumber = TextEditingController();
//
//   // data store
//   final firstName = TextEditingController();
//   final surname = TextEditingController();
//   final recoveryContact = TextEditingController();
//   final dateofBirth = TextEditingController();
//   final typeofDementia = TextEditingController();
//   final preexistingConditions = TextEditingController();
//   final primaryHospital = TextEditingController();
//   final nameOfDoctor = TextEditingController();
//   final currentMedication = TextEditingController();
//   final emergencyContact1 = TextEditingController();
//   final emergencyContact2 = TextEditingController();
//   final emergencyContact3 = TextEditingController();
//   final nextOfKin = TextEditingController();
//
//   final userRepo = Get.put(UserRepository());
//
//
//   void registerNewUser(String email, String password, String phoneNo){
//     AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
//     // AuthenticationRepository.instance.phoneAuth(phoneNo);
//     Get.to(() => createUserDetails(user));
//   }
//
//   void signOutUser(){
//     AuthenticationRepository.instance.signOut();
//
//   }
//
//   void loginExistingUser(String email, String password){
//     AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
//   }
//
//   void phoneAuth(String phoneNo){
//     AuthenticationRepository.instance.phoneAuth(phoneNo);
//   }
//
//   Future <void> createUserDetails(UserModel user) async{
//     await userRepo.createUserDetails(user);
//     AuthenticationRepository.instance.phoneAuth(user.phoneNo);
//     // Get.to(() => OTPController());
//     Get.to(() => const UserInformation()); // otp after details saved and otp passed
//   }
//
//
//   Future <void> addPWDInfo(String email, UserDataModel userdata) async{
//     await userRepo.addPWDInfo(email, userdata);
//     Get.to(() => HomePage());
//   }
//
//   // Future <void> googleLogin() async {
//   //   AuthenticationRepository.instance.signInWithGoogle();
//   //   Get.to(() => UserInformation());
//   // }
//
//
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project/accountverification1.dart';
import 'package:practice_project/authentication_repo.dart';
import 'package:practice_project/homepage.dart';
import 'package:practice_project/main.dart';
import 'package:practice_project/otpcontroller.dart';
import 'package:practice_project/signin.dart';
import 'package:practice_project/userinformation.dart';
import 'package:practice_project/usermodel.dart';
import 'package:practice_project/userrepository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restart_app/restart_app.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  // first two
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();

  // data store
  final firstName = TextEditingController();
  final surname = TextEditingController();
  final recoveryContact = TextEditingController();
  final dateofBirth = TextEditingController();
  final typeofDementia = TextEditingController();
  final preexistingConditions = TextEditingController();
  final primaryHospital = TextEditingController();
  final nameOfDoctor = TextEditingController();
  final currentMedication = TextEditingController();
  final emergencyContact1 = TextEditingController();
  final emergencyContact2 = TextEditingController();
  final emergencyContact3 = TextEditingController();
  final nextOfKin = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerNewUser(String email, String password, String phoneNo){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    phoneAuth(phoneNo);
  }

  Future<void> signOutUser() async {
    await AuthenticationRepository.instance.signOut();
    email.clear();
    password.clear();
    fullName.clear();
    phoneNumber.clear();
    firstName.clear();
    surname.clear();
    recoveryContact.clear();
    dateofBirth.clear();
    typeofDementia.clear();
    preexistingConditions.clear();
    primaryHospital.clear();
    nameOfDoctor.clear();
    currentMedication.clear();
    emergencyContact1.clear();
    emergencyContact2.clear();
    emergencyContact3.clear();
    nextOfKin.clear();
    Get.to(() => SplashPage());
  }

  void loginExistingUser(String email, String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  void phoneAuth(String phoneNo){
    AuthenticationRepository.instance.phoneAuth(phoneNo);
  }

  Future <void> createUserDetails(UserModel user) async{
    await userRepo.createUserDetails(user);
    Get.to(() => const UserInformation()); // otp after details saved and otp passed
  }

  Future <void> addPWDInfo(String email, UserDataModel userdata, String password) async{
    await userRepo.addPWDInfo(email, userdata);
    loginExistingUser(email, password);
    Get.to(() => HomePage());
  }

// Future <void> googleLogin() async {
//   AuthenticationRepository.instance.signInWithGoogle();
//   Get.to(() => UserInformation());
// }
}
