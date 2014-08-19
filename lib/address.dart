library address;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-address')
class Address extends RequiredComponent {
  String get streetId => "street-" + xid; 
  String get cityId => "city-" + xid; 
  String get stateId => "state-" + xid; 
  String get zipcodeId => "zipcode-" + xid;
  
  @override
  void enteredView() {
    super.enteredView();
  }
  
  Address.created() : super.created();
  
  String get street {
    InputElement inputElt = queryId(streetId);
    return inputElt.value;
  }
  String get city {
    InputElement inputElt = queryId(cityId);
    return inputElt.value;
  }
  String get state {
    // TODO: Clean this up
    SelectElement selectElt = this.shadowRoot.querySelector("x-state-selector").shadowRoot.querySelector("#" + stateId);
    return selectElt.value;
  }
  String get zipcode {
    InputElement inputElt = queryId(zipcodeId);
    return inputElt.value;
  }

  String get address {
    return capitalize_words(street) + ", " + capitalize_words(city)
        + ", " + state + ", " + zipcode;
  }
  
  String capitalize_words(String s) {
    String res = "";
    var split = s.split(' ');
    for (var s in split) {
      if (s.trim() != "") {
        res += capitalize(s.trim()) + " ";
      }
    }
    return res.trimRight();
  }
  
  String capitalize(String s) {
    if (s.isEmpty) {
      return "";
    }
    return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(street, "Street", streetId, errors);
    checkAndSetInvalid(city, "City", cityId, errors);
    if (!checkAndSetInvalid(zipcode, "Zipcode", zipcodeId, errors)) {
      if (!zipcode.contains(new RegExp(r"^[0-9]{5}$"))) {
        $[zipcodeId].classes.add("invalid");
        errors.add("Invalid zipcode");
      } else {
        $[zipcodeId].classes.remove("invalid");
      }
    }
  }
  
  void clear() {
    InputElement streetElt = queryId(streetId);
    InputElement cityElt = queryId(cityId);
    InputElement zipElt = queryId(zipcodeId);
    streetElt.value = ""; 
    cityElt.value = "";
    zipElt.value = "";
    streetElt.classes.remove("invalid"); 
    cityElt.classes.remove("invalid");
    zipElt.classes.remove("invalid");    
  }
}