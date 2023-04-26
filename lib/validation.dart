import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: "This is a required field"),
  PatternValidator(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$',
      errorText: "Password isn't strong enough!"),
]);

final textInputValidator = MultiValidator([
  RequiredValidator(errorText: "This is a required field"),
  // PatternValidator(r"^[A-Za-z]*$", errorText: "Not a valid name")
  MinLengthValidator(3, errorText: "Answer must be longer than 1 letter")
]);

final emailValidator = MultiValidator([
  EmailValidator(errorText: "Not a valid email, try again!"),
  RequiredValidator(errorText: "This is a required field"),
  PatternValidator(r'',
      errorText: "Password isn't strong enough!"),
]);

final phoneNumberValidator = MultiValidator([
  RequiredValidator(errorText: "This is a required field"),
  PatternValidator(
      r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)',
      errorText: "Not a valid phone number - ensure you add country code"),
  MaxLengthValidator(13, errorText: "Not a valid length - ensure you add country code"),
  MinLengthValidator(13, errorText: "Not a valid length - ensure you add country code")
]);

final dateValidator = MultiValidator([
  DateValidator("dd/MM/yyyy", errorText: "Not a valid date, try again!"),
  MaxLengthValidator(10, errorText: "Not a valid date - add the slashes"),
  MinLengthValidator(10, errorText: "Not a valid date - add the slashes"),
  RequiredValidator(errorText: "This is a required field")
]);
