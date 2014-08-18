library email;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'required_component.dart';

@CustomTag('x-email')
class Email extends RequiredComponent {
  @published String confirm;
  
  String get confirmEmailId => "confirm-email-" + xid;
  String get emailId => "email-" + xid;
  bool validEmail = false;
  bool emailConfirmed = true;
  bool get showConfirm => confirm == "true";
  bool first = true;
  
  Email.created() : super.created();
  
  String get email {
    InputElement emailInput = queryId(emailId);
    return emailInput.value.toLowerCase();
  }
  
  void validate(Event e) {
    validateEmail();
  
    if (first && e.target == queryId(emailId)) {            
      first = false;
    } else {
      confirmEmail();
      updateEmailStyle(true); 
    }
    updateEmailStyle(false);
  }
  
  void validateEmail() {
    RegExp validator = new RegExp(r'\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b',
                                  caseSensitive: false);
    String className;
    if (validator.hasMatch(email)) {
      validEmail = true;
    } else {            
      validEmail = false;
    }
  }
  
  void confirmEmail() {
    InputElement emailInput = queryId(emailId);
    InputElement confirmInput = queryId(confirmEmailId);
    
    String className;
    if (emailInput.value == confirmInput.value) {
      emailConfirmed = true;                
    } else {
      emailConfirmed = false;  
    }
  }
  
  void updateEmailStyle(bool confirm) {
    InputElement emailInput = queryId(emailId);
    InputElement confirmInput = queryId(confirmEmailId);
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
    if (checkAndSetInvalid(email, "Email", emailId, errors) && showConfirm) {
      queryId(confirmEmailId).classes.add("invalid");
    }
  }
  
  void clear() {
    InputElement emailInput = queryId(emailId);
    InputElement confirmInput = queryId(confirmEmailId);
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