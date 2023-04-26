import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  // so it can be stored properly in firestore as firestore uses Json, no ID also because it generates it owns id
  toJsonUser () {
    return {
      "Full Name": fullName,
      "Email": email,
      "Phone Number": phoneNo,
      "Password": password
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["Email"],
        password: data["Password"],
        fullName: data["Full Name"],
        phoneNo: data["Phone Number"]
    );
  }

}

class UserDataModel {
  final String? pwdId;
  final String firstName;
  final String surname;
  final String recoveryContact;
  final String dateofBirth;
  final String typeofDementia;
  final String preexistingConditions;
  final String primaryHospital;
  final String nameOfDoctor;
  final String currentMedication;
  final String emergencyContact1;
  final String emergencyContact2;
  final String emergencyContact3;
  final String nextOfKin;

  const UserDataModel({
    this.pwdId,
    required this.firstName,
    required this.surname,
    required this.recoveryContact,
    required this.dateofBirth,
    required this.typeofDementia,
    required this.preexistingConditions,
    required this.primaryHospital,
    required this.nameOfDoctor,
    required this.currentMedication,
    required this.emergencyContact1,
    required this.emergencyContact2,
    required this.emergencyContact3,
    required this.nextOfKin,
  });

  toJsonUserData () {
    return {
      "Firstname": firstName,
      "Surname": surname,
      "Recovery Contact": recoveryContact,
      "Date of Birth": dateofBirth,
      "Type of Dementia": typeofDementia,
      "Pre-existing Conditions": preexistingConditions,
      "Primary Hospital": primaryHospital,
      "Name of Doctor": nameOfDoctor,
      "Current Medication": currentMedication,
      "Emergency Contact 1": emergencyContact1,
      "Emergency Contact 2": emergencyContact2,
      "Emergency Contact 3": emergencyContact3,
      "Next of Kin": nextOfKin
    };
  }

  factory UserDataModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserDataModel(
        pwdId: document.id,
        firstName: data["Firstname"],
        surname: data["Surname"],
        recoveryContact: data["Recovery Contact"],
        dateofBirth: data["Date of Birth"],
        typeofDementia: data["Type of Dementia"],
        preexistingConditions: data["Pre-existing Conditions"],
        primaryHospital: data["Primary Hospital"],
        nameOfDoctor: data["Name of Doctor"],
        currentMedication: data["Current Medication"],
        emergencyContact1: data["Emergency Contact 1"],
        emergencyContact2: data["Emergency Contact 2"],
        emergencyContact3: data["Emergency Contact 3"],
        nextOfKin: data["Next Of Kin"]);
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      pwdId: json["pwdID"],
      firstName: json["firstName"],
      surname: json["surname"],
      recoveryContact: json["recoveryContact"],
      dateofBirth: json["dateofBirth"],
      typeofDementia: json["typeofDementia"],
      preexistingConditions: json["preexistingConditions"],
      primaryHospital: json["primaryHospital"],
      nameOfDoctor: json["nameOfDoctor"],
      currentMedication: json["currentMedication"],
      emergencyContact1: json["emergencyContact1"],
      emergencyContact2: json["emergencyContact2"],
      emergencyContact3: json["emergencyContact3"],
      nextOfKin: json["nextOfKin"],
    );
  }



}
