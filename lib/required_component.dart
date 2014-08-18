library required_component;

import 'package:polymer/polymer.dart';
import 'package:sprintf/sprintf.dart';
import 'dart:html';
        
abstract class RequiredComponent extends PolymerElement {
  @published String xid = "1";

  @published String required;
  @published bool isRequired;
  
  RequiredComponent.created() : super.created() {
    isRequired = required == "true" ? true : false;
  }
  
  Element queryId(String id) {
    Element e = $[id];
    if (e == null) {
      throw new Exception('#' + id + " was not found");    
    }
    return e;
  }
  
  void check(List<String> errors);
  void clear();
  
  bool checkAndSetInvalid(String field, String fieldName, String id,
                          List<String> errors) {
    if (field == "") {
      $[id].classes.add("invalid");
      errors.add(sprintf("%s is a required field.", [fieldName]));
      return true;
    }
    $[id].classes.remove("invalid");
    return false;
  }
}