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
    return street + ", " + city + ", " + state + ", " + zipcode;
  }
  
  void check(List<String> errors) {
    checkAndSetInvalid(street, "Street", streetId, errors);
    checkAndSetInvalid(city, "City", cityId, errors);
    checkAndSetInvalid(zipcode, "Zipcode", zipcodeId, errors);
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