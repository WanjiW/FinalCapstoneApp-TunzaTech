import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_project/signupcontroller.dart';
import 'package:practice_project/usermodel.dart';
import 'package:practice_project/validation.dart';



void main() => runApp(const UserInformation());

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  static const String _title = 'UserInformation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: SingleChildScrollView(child: MyStatefulWidget()),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final controller = Get.put(SignUpController());

  final _formKeyC = GlobalKey<FormState>();
  @override
  void dispose() {
    // Dispose of _formKeyB when the widget is removed from the tree
    _formKeyC.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
          key: _formKeyC,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 90),
      Container(
            width: 365,
            child: Text("User Information",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28,
                    fontWeight: FontWeight.bold))),
      SizedBox(height: 10),
      Container(
            width: 365,
            child: Text(
                "This section is to collect some data about your loved one with dementia. This will help us "
                "display the information for you so you don't forget! None of the data will be used unethically.",
                style: TextStyle(
                    color: Color.fromRGBO(0, 85, 85, 100),
                    fontSize: 15,
                    fontStyle: FontStyle.italic))),
      SizedBox(height: 55),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.firstName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Firstname',
              ),
              validator: textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.surname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Surname',
              ),
              validator: textInputValidator
            )),
            SizedBox(height: 20),
            Container(
                width: 365,
                child: TextFormField(
                  controller: controller.recoveryContact,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Recovery Contact',
                    helperText: 'Recovery Email (yours or a close friend/family member/'
                  ),
                  validator: emailValidator
                )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.dateofBirth,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date of Birth',
                helperText: "dd/mm/yyyy format"
              ),
              validator: dateValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.typeofDementia,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type of Dementia',
                helperText: 'Diagnosis'
              ),
              validator:textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.preexistingConditions,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pre-existing Conditions',
                helperText: 'Seperate conditions with a comma e.g. - diabetes, depression, \nIf none, type N/A'
              ),
              validator: textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.primaryHospital,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Primary Hospital',
              ),
              validator: textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.nameOfDoctor,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name of doctor',
              ),
              validator: textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.currentMedication,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Current Medication',
                helperText: 'Seperate conditions with a comma e.g. - flugone, celabet \nIf none, type N/A'
              ),
              validator: textInputValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.emergencyContact1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Emergency Contact 1',
                helperText: 'Phone number of a: family member, friend, doctor, helper etc.'
              ),
              validator: phoneNumberValidator
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.emergencyContact2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Emergency Contact 2',
                helperText: 'Phone number of a: family member, friend, doctor, helper etc.'
              ),
              validator: phoneNumberValidator,
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.emergencyContact3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Emergency Contact 3',
                helperText: 'Phone number of a: family member, friend, doctor, helper etc.'
              ),
             validator: phoneNumberValidator,
            )),
      SizedBox(height: 20),
      Container(
            width: 365,
            child: TextFormField(
              controller: controller.nextOfKin,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Next of Kin',
              ),
              validator: textInputValidator,
            )),
      SizedBox(height: 25),
      Container(
            child: ElevatedButton(
                onPressed: () {
                  print(_formKeyC.currentState!.validate());
                  if (_formKeyC.currentState != null &&
                      _formKeyC.currentState!.validate()) {

                    //user data, to link the info stored to this particular user
                    final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNumber.text.trim()
                    );

                    // call function that saves the data added in the form!
                    final userdata = UserDataModel(
                        firstName: controller.firstName.text.trim(),
                        surname: controller.surname.text.trim(),
                        recoveryContact: controller.recoveryContact.text.trim(),
                        dateofBirth: controller.dateofBirth.text.trim(),
                        typeofDementia: controller.typeofDementia.text.trim(),
                        preexistingConditions: controller.preexistingConditions.text.trim(),
                        primaryHospital: controller.primaryHospital.text.trim(),
                        nameOfDoctor: controller.nameOfDoctor.text.trim(),
                        currentMedication: controller.currentMedication.text.trim(),
                        emergencyContact1: controller.emergencyContact1.text.trim(),
                        emergencyContact2: controller.emergencyContact2.text.trim(),
                        emergencyContact3: controller.emergencyContact3.text.trim(),
                        nextOfKin: controller.nextOfKin.text.trim()
                    );

                    SignUpController.instance.addPWDInfo(user.email, userdata, user.password);

                  }
                },
                child: Text(
                  "Save & Finish",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(116, 199, 243, 100)),
                    fixedSize: MaterialStateProperty.all<Size>(Size(365, 44))))),
      SizedBox(height: 20),
    ]),
        ));
  }
}
