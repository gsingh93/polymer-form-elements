library full_name;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-full-name')
class FullName extends RequiredComponent {
  String get firstNameId => "first-name"; 
  String get lastNameId => "last-name";
  
  FullName.created() : super.created();
  
  String get firstName {
    InputElement firstNameElt = queryId(firstNameId);
    return firstNameElt.value;
  }
  
  String get lastName {
    InputElement lastNameElt = queryId(lastNameId);
    return lastNameElt.value;
  }
  
  String get fullName {
    return capitalize(firstName.trim()) + " " + capitalize(lastName.trim());
  }
  
  String capitalize(String s) {
    if (s.isEmpty) {
      return "";
    }
    return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
  }
  
  void check(List<String> errors) {
    if (!checkAndSetInvalid(firstName, "First Name", firstNameId, errors)) {
      if (firstName.trim().split(' ').length != 1) {
        errors.add("First name can only be one word");
        queryId(firstNameId).classes.add("invalid");
      }
    }
    if (!checkAndSetInvalid(lastName, "Last Name", lastNameId, errors)) {
      if (lastName.trim().split(' ').length != 1) {
        errors.add("Last name can only be one word");
        queryId(lastNameId).classes.add("invalid");
      }
    }
  }
  
  void clear() {
    InputElement firstNameElt = queryId(firstNameId);
    InputElement lastNameElt = queryId(lastNameId);
    firstNameElt.value = "";
    lastNameElt.value = "";
    firstNameElt.classes.remove("invalid");
    lastNameElt.classes.remove("invalid");
  }
}