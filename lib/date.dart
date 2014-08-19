library date;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';
        
@CustomTag('x-date')
class Date extends RequiredComponent {
  String get dayId => "x-date-day";
  String get monthId => "x-date-month";
  String get yearId => "x-date-year";
  
  Date.created() : super.created();
  
  String get date {
    SelectElement dayElt = queryId(dayId);
    SelectElement monthElt = queryId(monthId);
    SelectElement yearElt = queryId(yearId);
    
    return monthElt.value + " " + dayElt.value + ", " + yearElt.value;          
  }
  
  void check(List<String> errors) {
  }
  
  void clear() {
  }
}