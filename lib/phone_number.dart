library phone_number;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-phone-number')
class PhoneNumber extends RequiredComponent {
  String get phoneNumberId => "phone-number-" + xid;
  
  String get phoneNumber {
    InputElement phoneNumber = queryId(phoneNumberId);
    return phoneNumber.value;
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(phoneNumber, "Phone Number", phoneNumberId, errors);
  }
  
  void clear() {
    InputElement phoneNumber = queryId(phoneNumberId);
    phoneNumber.value = "";
    phoneNumber.classes.remove('invalid');
  }
  
  PhoneNumber.created() : super.created();
}   