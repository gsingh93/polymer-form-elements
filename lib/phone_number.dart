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
    if (!checkAndSetInvalid(phoneNumber, "Phone number", phoneNumberId, errors)) {
      if (!phoneNumber.contains(new RegExp(r"^[0-9]{3}-[0-9]{3}-[0-9]{4}$"))) {
        $[phoneNumberId].classes.add("invalid");
        errors.add("Phone number should be in xxx-xxx-xxxx format");
      } else {
        $[phoneNumberId].classes.remove("invalid");
      }
    }
  }
  
  void clear() {
    InputElement phoneNumber = queryId(phoneNumberId);
    phoneNumber.value = "";
    phoneNumber.classes.remove('invalid');
  }
  
  PhoneNumber.created() : super.created();
}   