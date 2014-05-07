library email;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'required_component.dart';

@CustomTag('x-email')
class Email extends RequiredComponent {
  @published String confirm;
  
  String get _confirmEmailId => "confirm-email-" + xid;
  String get _emailId => "email-" + xid;
  bool validEmail = false;
  bool emailConfirmed = true;
  bool get showConfirm => confirm == "true";
  bool first = true;
  
  Email.created() : super.created();
  
  String get email {
    InputElement emailInput = $[_emailId];
    return emailInput.value;
  }
  
  void validate(Event e) {
    validateEmail();
  
    if (first && e.target == $[_emailId]) {            
      first = false;
    } else {
      confirmEmail();
      updateEmailStyle(true); 
    }
    updateEmailStyle(false);
  }
  
  void validateEmail() {
    InputElement emailInput = $[_emailId];
    RegExp validator = new RegExp(r'\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b',
                                  caseSensitive: false);
    String className;
    if (validator.hasMatch(emailInput.value)) {
      validEmail = true;
    } else {            
      validEmail = false;
    }
  }
  
  void confirmEmail() {
    InputElement emailInput = $[_emailId];
    InputElement confirmInput = $[_confirmEmailId];
    
    String className;
    if (emailInput.value == confirmInput.value) {
      emailConfirmed = true;                
    } else {
      emailConfirmed = false;  
    }
  }
  
  void updateEmailStyle(bool confirm) {
    InputElement emailInput = $[_emailId];
    InputElement confirmInput = $[_confirmEmailId];
    String className;
    if (validEmail && emailConfirmed) {
      className = "valid";                
    } else {
      className = "invalid";    
    }
    
    if (confirm) {                                
      confirmInput.classes..remove("valid")
                          ..remove("invalid")
                          ..add(className);
    } else {
      emailInput.classes..remove("valid")
                        ..remove("invalid")
                        ..add(className);
    }
  }
  
  void check(List<String> errors) {
    if (checkAndSetInvalid(email, "Email", _emailId, errors) && showConfirm) {
      $[_confirmEmailId].classes.add("invalid");
    }
  }
  
  void clear() {
    InputElement emailInput = $[_emailId];
    InputElement confirmInput = $[_confirmEmailId];
    emailInput.value = "";
    confirmInput.value = "";
    emailInput.classes..remove('invalid')
                      ..remove('valid');
    confirmInput.classes..remove('invalid')
                        ..remove('valid');
    validEmail = false;
    emailConfirmed = true;
    first = true;
  }
}