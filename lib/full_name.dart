library full_name;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-full-name')
class FullName extends RequiredComponent {
  String get firstNameId => "first-name-" + xid; 
  String get lastNameId => "last-name-" + xid;
  
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
    return capitalize(firstName) + " " + capitalize(lastName);
  }
  
  String capitalize(String s) {
    if (s.isEmpty) {
      return "";
    }
    return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(firstName, "First Name", firstNameId, errors);
    checkAndSetInvalid(lastName, "Last Name", lastNameId, errors);
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