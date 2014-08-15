import 'package:polymer/polymer.dart';

@CustomTag('x-state-selector')
class StateSelector extends PolymerElement {
  @published String xid = "1";
  String get stateId => "state-" + xid;
  
  StateSelector.created() : super.created();
}