library phone_number;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';
import 'required_component.dart';

@CustomTag('x-phone-number')
class PhoneNumber extends RequiredComponent {
  String get _phoneNumberId => "phone-number-" + xid;
  
  String get phoneNumber {
    InputElement phoneNumber = $[_phoneNumberId];
    return phoneNumber.value;
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(phoneNumber, "Phone Number", _phoneNumberId, errors);
  }
  
  void clear() {
    InputElement phoneNumber = $[_phoneNumberId];
    phoneNumber.value = "";
    phoneNumber.classes.remove('invalid');
  }
  
  PhoneNumber.created() : super.created() {
    Timer.run(() => _postInit(_phoneNumberId));
  }
}     

void _postInit(String id) {
//  js.scoped(() {
//    js.context["jQuery"]('#' + id)["mask"]("(999) 999-9999");
//  });
}   