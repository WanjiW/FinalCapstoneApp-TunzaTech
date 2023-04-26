// handles all CRUD operationsss

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:practice_project/usermodel.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // point to firestore db
  final _db = FirebaseFirestore.instance;

  createUserDetails(UserModel user) async {
    // the specific collection and in json format
    await _db
        .collection("Users")
        .add(user.toJsonUser())
        .whenComplete(() => Get.snackbar("Success", "Data Added :)",
            snackPosition: SnackPosition.BOTTOM))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Error :(", snackPosition: SnackPosition.BOTTOM);
      print(error.toString());
    });

    return user.email;
  }

  Future <UserModel> getSpecificUser(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userDetails =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userDetails;
  }

  Future<void> addPWDInfo(String userEmail, UserDataModel userdata) async {
    try {
      // Query the "Users" collection for the user document with the specified email.
      final QuerySnapshot querySnapshot = await _db
          .collection('Users')
          .where('Email', isEqualTo: userEmail)
          .get();

      // Get a reference to the user document by its ID.
      final DocumentReference userDocRef = querySnapshot.docs.first.reference;

      // Add a new document to the user document.
      await userDocRef
          .collection('PWD-Data')
          .add(userdata.toJsonUserData())
          .whenComplete(() => Get.snackbar("Success", "PWD Data Added :)",
              snackPosition: SnackPosition.BOTTOM));
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future <UserDataModel> getPWDData (String email) async {
  //
  //   // final userRef = _db.collection("Users").doc();
  //   // final subcollectionRef = userRef.collection("PWD-Data");
  //   // final snapshot = await subcollectionRef.where(
  //   //     "Email", isEqualTo: email).get();
  //   //
  //   //
  //   // if (snapshot.docs.isNotEmpty) {
  //   //   UserDataModel userdata = UserDataModel.fromJson(snapshot.docs.first.data());
  //   //   throw userdata;
  //   // } else {
  //   //   throw "Not working";
  //   // }
  //
  //   final userRef = _db.collection("Users").where("Email", isEqualTo: email);
  //   final userSnapshot = await userRef.get();
  //
  //   if (userSnapshot.docs.length == 0) {
  //     throw Exception("User not found");
  //   }
  //
  //   final userDataRef = userSnapshot.docs[0].reference.collection("PWD-Data");
  //   final userDataSnapshot = await userDataRef.get();
  //
  //   if (userDataSnapshot.docs.length == 0) {
  //     throw Exception("PWD-Data not found for user");
  //   }
  //
  //   final data = userDataSnapshot.docs[0].data();
  //   // throw data;
  //
  //   return UserDataModel.fromJson(data);
  //
  //   }

  // Future <UserDataModel> getPWDData(String email) async {
  //   final userRef = _db.collection("Users").where("Email", isEqualTo: email);
  //   final userSnapshot = await userRef.get();
  //
  //   if (userSnapshot.docs.length == 0) {
  //     throw Exception("User not found");
  //   }
  //
  //   final userDataRef = userSnapshot.docs[0].reference.collection("PWD-Data");
  //   final userDataSnapshot = await userDataRef.get();
  //   // print(userDataRef);
  //
  //   if (userDataSnapshot.docs.length == 0) {
  //     print(userSnapshot.docs[0].data());
  //     print(userDataSnapshot.docs[0].data());
  //     throw Exception("PWD-Data not found for user");
  //   }
  //
  //   final data = userDataSnapshot.docs[0].data();
  //   return UserDataModel.fromJson(data);
  // }

  // Future<UserDataModel> getUserPWDData(String email) async {
  //   final snapshot = await _db.collection("User Data").where("Email", isEqualTo: email).get();
  //   final userDataSnapshot = snapshot.docs;
  //   if (userDataSnapshot.isEmpty) {
  //     throw "Error! - Snapshot empty";
  //   }
  //   final data = userDataSnapshot[0].data();
  //   final userData = UserDataModel(
  //       // pwdID: null,
  //       firstName: data["Firstname"],
  //       surname: data["Surname"],
  //       recoveryContact: data["Recovery Contact"],
  //       dateofBirth: data["Date of Birth"],
  //       typeofDementia: data["Type of Dementia"],
  //       preexistingConditions: data["Pre-existing Conditions"],
  //       primaryHospital: data["Primary Hospital"],
  //       nameOfDoctor: data["Name of Doctor"],
  //       currentMedication: data["Current Medication"],
  //       emergencyContact1: data["Emergency Contact 1"],
  //       emergencyContact2: data["Emergency Contact 2"],
  //       emergencyContact3: data["Emergency Contact 3"],
  //       nextOfKin: data["Next Of Kin"],
  //   );
  //   return userData;
  // }

  Future<UserDataModel> getUserPWDData(String email) async {
    try {
      final selectUser = await _db.collection("Users").where("Email", isEqualTo: email).get();

      if (selectUser.docs.isEmpty) {
        throw "No docs for this email";
      }

      print(selectUser); // correct, returns a snapshot
      final docu = selectUser.docs.first; // always returns our PWD-Data because each user has one PwD file attached for now and even if we scale, it can be called like doc[index]
      print("document returned at getUserPWDData() $docu"); // correct, returns a document

      final pwdData = docu.data();
      final values = pwdData.values;
      print("document.data: $values");
      final docID = docu.id;
      print("Document ID: $docID");

      final userDocID = await _db.collection("Users").doc(docID); // gets our specific user, w21
      final pwdDataSnapshot = await userDocID.collection("PWD-Data").get(); // gets the PWD-Data file
      final pwdDoc = pwdDataSnapshot.docs.first.data();
      print("pwdData: $pwdData");

      // final pwdData1 = pwdData["Next of Kin"];
      // print("name: $pwdData1");

      final userData = UserDataModel(
        // pwdId: docID,
        firstName: pwdDoc["Firstname"] ?? "",
        surname: pwdDoc["Surname"] ?? "",
        recoveryContact: pwdDoc["Recovery Contact"] ?? "",
        dateofBirth: pwdDoc["Date of Birth"] ?? "",
        typeofDementia: pwdDoc["Type of Dementia"] ?? "",
        preexistingConditions: pwdDoc["Pre-existing Conditions"] ?? "",
        primaryHospital: pwdDoc["Primary Hospital"] ?? "",
        nameOfDoctor: pwdDoc["Name of Doctor"] ?? "",
        currentMedication: pwdDoc["Current Medication"] ?? "",
        emergencyContact1: pwdDoc["Emergency Contact 1"] ?? "",
        emergencyContact2: pwdDoc["Emergency Contact 2"] ?? "",
        emergencyContact3: pwdDoc["Emergency Contact 3"] ?? "",
        nextOfKin: pwdDoc["Next of Kin"] ?? "",
      );

      print("User data: $userData");
      return userData;

    } catch (e) {
      print("Error message in getUserPWD data, userrepo: ${e.toString()}");
      throw e.toString();
    }
  }


  Future<void> updateSpecificUser(UserModel user) async {
    final selectUser = await _db
        .collection("Users")
        .where('Email', isEqualTo: user.email)
        .get();
    final userDoc = selectUser.docs.first;
    final userID = userDoc.id;
    await _db.collection("Users").doc(userID).update(user.toJsonUser());
  }

  Future<QuerySnapshot> getDocuments(String email) async {
    final selectUser = await _db.collection("Users").where('Email', isEqualTo: email).get();

    print(selectUser); // correct, returns a snapshot
    final docu = selectUser.docs.first; // always returns our PWD-Data because each user has one PwD file attached for now and even if we scale, it can be called like doc[index]
    print("document returned at getUserPWDData() $docu"); // correct, returns a document

    final pwdDoc = docu.data();
    print("document.data: $pwdDoc");
    final docID = docu.id;

    print("getdocument() func");
    print( _db.collection('collectionName').doc(docID).collection('otherCollectionName').get());
    return await _db.collection('collectionName').doc(docID).collection('otherCollectionName').get();
  }
}
