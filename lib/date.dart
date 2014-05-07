import 'package:polymer/polymer.dart';
import 'dart:html';
import 'required_component.dart';
        
@CustomTag('x-date')
class Date extends RequiredComponent {
  String get _dayId => "x-date-day-" + xid;
  String get _monthId => "x-date-month-" + xid;
  String get _yearId => "x-date-year-" + xid;
  
  Date.created() : super.created();
  
  String get date {
    SelectElement dayElt = $[_dayId];
    SelectElement monthElt = $[_monthId];
    SelectElement yearElt = $[_yearId];
    
    return monthElt.value + " " + dayElt.value + ", " + yearElt.value;          
  }
  
  void check(List<String> errors) {
  }
  
  void clear() {
  }
}