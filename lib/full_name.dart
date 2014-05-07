import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-full-name')
class FullName extends RequiredComponent {
  String get _firstNameId => "first-name-" + xid; 
  String get _lastNameId => "last-name-" + xid;
  
  FullName.created() : super.created();
  
  String get firstName {
    InputElement firstNameElt = $[_firstNameId];
    return firstNameElt.value;
  }
  
  String get lastName {
    InputElement lastNameElt = $[_lastNameId];
    return lastNameElt.value;
  }          
  
  String get fullName {
    return firstName + " " + lastName;
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(firstName, "First Name", _firstNameId, errors);
    checkAndSetInvalid(lastName, "Last Name", _lastNameId, errors);
  }
  
  void clear() {
    InputElement firstNameElt = $[_firstNameId];
    InputElement lastNameElt = $[_lastNameId];
    firstNameElt.value = "";
    lastNameElt.value = "";
    firstNameElt.classes.remove("invalid");
    lastNameElt.classes.remove("invalid");
  }
}