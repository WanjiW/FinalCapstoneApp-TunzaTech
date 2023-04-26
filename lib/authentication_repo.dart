
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_project/accountverification1.dart';
import 'package:practice_project/homepage.dart';
import 'package:practice_project/main.dart';
import 'package:practice_project/onboarding1.dart';
import 'package:practice_project/signin.dart';
import 'package:practice_project/signup.dart';
import 'package:practice_project/signupemailpasswordfailure.dart';
import 'package:practice_project/userinformation.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // variables related to firebase - firebase auth and user
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser; // to keep user logged in and remember user
  var verificationID = ''.obs;  // keep track of otp, via listening, the ''


@override
  void onReady(){ // checks if user is still logged in etc if they close and open the app
  firebaseUser = Rx<User?>(_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges()); // always listening to user actions


  ever(firebaseUser, (User? user) {
    if (user == null) {
      print('User signed out');
    } else {
      print('User signed in');
    }
  });

  // ever(firebaseUser, _setInitialScreen);
}

_setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SplashPage());
    } else {
      Get.offAll(() => const HomePage());
      }
    }

  Future <void> phoneAuth (String phoneNo) async {
  print("phoneNumber in phoneAuth = $phoneNo");
  await _auth.verifyPhoneNumber(phoneNumber: phoneNo,
  verificationCompleted: (credential) async {
      print("in verification completed");
    await _auth.signInWithCredential(credential);
  },
    codeSent: (verificationID, resendToken){
      // this.verificationID.value = verificationID; // actual
      print("code sent vID: $verificationID");
      this.verificationID.value = verificationID;
    },
    codeAutoRetrievalTimeout: (verificationID){
      // this.verificationID.value = verificationID; // actual
      print("code timeout vID: $verificationID");
      this.verificationID.value = verificationID;
    },
    verificationFailed: (e) {
      if (e.code == 'invalid-phone-number'){
        throw('Phone number is not valid');
      } else{
        throw('Error!: ${e.code}');
      }
    },
  );
}

  Future <bool> verifyOTP(String otp) async {
  print("OTP in verifyOTP: $otp");
  print("verfication ID in verifyOTP: ${this.verificationID.value}");

  if (this.verificationID.value == null) {
    print("Verification ID is null!");
    return false;
  }

  var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationID.value, smsCode: otp)); // for regular use
  if (credentials.user == null) {
    print("User credentials null!");
    Get.back();
  } else {
    Get.offAll(() => const UserInformation());
  }
  throw("error");
}

// signUp
  Future <void> createUserWithEmailAndPassword(String email, String password) async{
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    firebaseUser != null ? Get.offAll(() => const AccountVerificationA()): Get.to(() => const SplashPage());
  } on FirebaseAuthException catch(e){
    final ex = SignUpWithEmailandPasswordFailure.code(e.code);
    throw ex;
  } catch(_){
    const ex = SignUpWithEmailandPasswordFailure();
    print("Exception - ${ex.message}");
    throw ex;
  }
}

  Future<void> loginUserWithEmailAndPassword(String email, String password) async{

    await FirebaseAuth.instance.signOut();

    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser != null ? Get.offAll(() => const HomePage()): Get.to(() => const SignIn());
      firebaseUser != null ? Get.offAll(() => const HomePage()): Get.to(() => const SignIn());
    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailandPasswordFailure.code(e.code);
      throw ex;
    } catch(_){
      const ex = SignUpWithEmailandPasswordFailure();
      print("Exception - ${ex.message}");
      throw ex;
    }
  }

  Future <void> signOut() async {
    try {
      await _auth.signOut();
      firebaseUser.value = null; // set the current user to null
    } catch (e) {
      print("Error signing out (at auth repo): $e");
    }
  }
  

}