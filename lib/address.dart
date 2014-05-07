library address;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';

@CustomTag('x-address')
class Address extends RequiredComponent {
  String get _streetId => "street-" + xid; 
  String get _cityId => "city-" + xid; 
  String get _stateId => "state-" + xid; 
  String get _zipcodeId => "zipcode-" + xid;
  
  @override
  void enteredView() {
    super.enteredView();
  }
  
  Address.created() : super.created();
  
  String get street {
    InputElement inputElt = $[_streetId];
    return inputElt.value;
  }
  String get city {
    InputElement inputElt = $[_cityId];
    return inputElt.value;
  }
  String get state {
    SelectElement selectElt = $[_stateId];
    return selectElt.value;
  }
  String get zipcode {
    InputElement inputElt = $[_zipcodeId];
    return inputElt.value;
  }

  String get address {
    return street + ", " + city + ", " + state + ", " + zipcode;
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(street, "Street", _streetId, errors);
    checkAndSetInvalid(city, "City", _cityId, errors);
    checkAndSetInvalid(zipcode, "Zipcode", _zipcodeId, errors);
  }
  
  void clear() {
    InputElement streetElt = $[_streetId];
    InputElement cityElt = $[_cityId];
    InputElement zipElt = $[_zipcodeId];
    streetElt.value = ""; 
    cityElt.value = "";
    zipElt.value = "";
    streetElt.classes.remove("invalid"); 
    cityElt.classes.remove("invalid");
    zipElt.classes.remove("invalid");    
  }
}